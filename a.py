from bs4 import BeautifulSoup

print('----------------')
print('----------------')
print('----------------')
print('----------------')
response_xml_as_string = """<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns="urn:get_recall_attributes"><SOAP-ENV:Header></SOAP-ENV:Header><SOAP-ENV:Body SOAP-ENV:encodingStyle"http://schemas.xmlsoap.org/soap/encoding/"><ns:GetRecallAttributesResponse><Response>PartNo:544247510001,A,6~Description:FUEL SYSTEM IFD CNG FUEL LINES &amp; CLAMPS~Modifiation_description:NOTE 6 UPDATED FOR TIGHTENING SEQUENCE. NOTE 9 ADDED.LOCATION DETAILS ADDED IN SECTION E-E AND P-P. CYLINDER VALVE KNOB POSITIONS ADDED.TABLE B UPDATED SETION K-K DESCRIPTION CHANGED.VIEWS ADDED FOR ALTROZ &amp; PUNCH HP LINE.SHEET 3 VIEWS UPD~Track_Trace:~Critical_to_Emission_Critical_to_Safety:~Drawing_Sheet_Size_and_Sheetorientation:~</Response></ns:GetRecallAttributesResponse></SOAP-ENV:Body></SOAP-ENV:Envelope>"""

soup = BeautifulSoup(response_xml_as_string, 'xml')
ns2 = soup.find('ns:GetRecallAttributesResponse')
print(ns2)

print( ns2.attrs)

print('----------------')
print('----------------')
print('----------------')
print('----------------')