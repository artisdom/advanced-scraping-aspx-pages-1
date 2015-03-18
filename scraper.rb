require 'scraperwiki'
import scraperwiki
import mechanize
import re

# ASPX pages are some of the hardest challenges because they use javascript and forms to navigate
# Almost always the links go through the function function __doPostBack(eventTarget, eventArgument)
# which you have to simulate in the mechanize form handling library

# This example shows how to follow the Next page link

url = 'http://escorpio.csd.gob.es/BusquedaPublicaMapa/Pages/Ficha/Visor.aspx?43575A49306D4B376F675650496E386D3555796770513D3D=4C715546365263665A476B3D&4D6378664A3349666E67513D=69466856304B484E524F773D'
br = mechanize.Browser()

    # sometimes the server is sensitive to this information
br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
response = br.open(url)
html = response.read()
print html
for pagenum in range(1):
    html = response.read()
    print "Page %d  page length %d" % (pagenum, len(html))
    print "Clinicians found:", re.findall("</td><td align=\"left\">.*?", html)


    br.select_form(name='aspnetForm')
    br.form.set_all_readonly(False)
    br['__EVENTTARGET'] = 'ctl00$ContentPlaceHolder2$grdRecords$ctl05$lnkViewEdit'
    br['__EVENTARGUMENT'] = ''
    response = br.submit()
html= response.read()
print html
print "Clinicians found:", re.findall("</td><td align=\"left\">.*?", html)

import scraperwiki
import mechanize
import re

# ASPX pages are some of the hardest challenges because they use javascript and forms to navigate
# Almost always the links go through the function function __doPostBack(eventTarget, eventArgument)
# which you have to simulate in the mechanize form handling library

# This example shows how to follow the Next page link

url = 'http://gvaup.in/frmApplicantLogin.aspx?d=23&c=1&s=2'
br = mechanize.Browser()

    # sometimes the server is sensitive to this information
br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
response = br.open(url)
html = response.read()
print html
for pagenum in range(1):
    html = response.read()
    print "Page %d  page length %d" % (pagenum, len(html))
    print "Clinicians found:", re.findall("</td><td align=\"left\">(.*?)</td>", html)


    br.select_form(name='aspnetForm')
    br.form.set_all_readonly(False)
    br['__EVENTTARGET'] = 'ctl00$ContentPlaceHolder2$grdRecords$ctl05$lnkViewEdit'
    br['__EVENTARGUMENT'] = ''
    response = br.submit()
html= response.read()
print html
print "Clinicians found:", re.findall("<td>(.*?)\\r\\n</td>", html,re.DOTALL)
