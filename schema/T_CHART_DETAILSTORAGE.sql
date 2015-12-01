create schema T_CHART_DETAILSTORAGE_schema
source type CSV
fields(
  "owner_num" type str,
  "deptid"    type str,
  "deptname"  type str,
  "sumdate"   type str,
  "sumcount"  type double,
  "sumweight" type double
)
RECORD DELIMITER "CRLF"
FIELD DELIMITER ","
TEXT QUALIFIER "NULL";

CREATE PARSER T_CHART_DETAILSTORAGE_parser
TYPE rcd
SCHEMA T_CHART_DETAILSTORAGE_schema;

CREATE TABLE T_CHART_DETAILSTORAGE using T_CHART_DETAILSTORAGE_parser; 

CREATE INDEX T_CHART_DETAILSTORAGE_index ON TABLE T_CHART_DETAILSTORAGE (owner_num);