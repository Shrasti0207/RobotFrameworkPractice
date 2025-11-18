*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

Suite Setup    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}    
Suite Teardown    Disconnect From Database

*** Variables ***
${DBName}    example_db
${DBUser}    root
${DBPass}    root
${DBHost}    127.0.0.1
${DBPort}    3306

*** Test Cases ***
Create person table
    Execute Sql String    DROP TABLE IF EXISTS person
    ${output}=     Execute Sql String    Create table person(id integer, name varchar(100));
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    None

Inserting the values
    ${output}=     Execute Sql Script    ./TestData/insertPersonTableData.sql
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    None

Check data is exist in database
    ${output}=     Query    select id from person where name = 'shrasti';
    Should Not Be Empty    ${output}

Check data is not exist in database
    ${output}=     Query    select id from person where name = 'jio';
    Should Be Empty    ${output}

Check person table exist in db
    Table Must Exist    person
    
Row count validation
    ${count}=    Row Count    Select * from person
    Should Be Equal As Integers    ${count}    4
    