import requests
from xml.etree import ElementTree
import xmltodict
import xml.etree.ElementTree as ET
# SOAP request URL
url = "http://172.22.97.12:9080/cgi/get_recall_attributes.cgi"
  
# structured XML
payload = """<?xml version=\"1.0\" encoding=\"utf-8\"?>
               <soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:get_recall_attributes">
                    <soapenv:Header/>
                        <soapenv:Body>
                            <urn:GetRecallAttributes soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                            <Item xsi:type="xsd:string">544247510001</Item>
                            <Rev xsi:type="xsd:string">A</Rev>
                            <Seq xsi:type="xsd:string">6</Seq>
                            </urn:GetRecallAttributes>
                        </soapenv:Body>
                </soapenv:Envelope>"""

# headers

headers = {
    'Content-Type': 'text/xml; charset=utf-8'
}
# POST request
response = requests.request("POST", url, headers=headers, data=payload)
  
# prints the response

# print(response.text)
stack_d = xmltodict.parse(response.content)
stack_d['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns:GetRecallAttributesResponse']['Response']
print('----------------')
print('----------------')
print('----------------')
print('----------------')
print(stack_d)
print(type(stack_d))
print('------------')

# for item in stack_d.items():
#    print(item)


# print(response)

