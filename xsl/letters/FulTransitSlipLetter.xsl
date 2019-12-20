<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:ext="http://exslt.org/common"
  extension-element-prefixes="date ext">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />



<!-- SKRIPTOTEKETS TILLEGG -->
     <xsl:element name="meta">
          <xsl:attribute name="name">libnummer</xsl:attribute>
          <xsl:attribute name="content">
            <xsl:for-each select="notification_data/request">
              <!--
                Vi bruker starts-with for å også fange opp verdier av typen
                "UiO Informatikkbiblioteket - 1030317 Acquisitions Department",
                men det betyr at vi må være litt forsiktige med rekkefølgen - første treff vinner.
              -->
              <xsl:choose>
                <xsl:when test="starts-with(calculated_destination_name, 'UiO Arkeologisk bibliotek')">
                 103 &#160; 0011
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Etnografisk bibliotek Numismatikk')">
                 103 &#160; 0010
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Etnografisk bibliotek')">
                 103 &#160; 0010
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO HumSam-biblioteket')">
                 103 &#160; 0300
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Ibsensenterets bibliotek')">
                 103 &#160; 0104
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Informatikkbiblioteket')">
                 103 &#160; 0317
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Juridisk bibliotek DJ')">
                 103 &#160; 0000
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Kriminologibiblioteket')">
                 103 &#160; 0002
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Læringssenteret DN')">
                 103 &#160; 0009
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Medisinsk bibliotek Rikshospitalet')">
                 103 &#160; 2300
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Menneskerettighetsbiblioteket')">
                 103 &#160; 0048
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO NSSF Selvmordsforskning/forebygging')">
                 103 &#160; 2304
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Naturhistorisk museum biblioteket')">
                 103 &#160; 0500
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Medisinsk bibliotek Odontologi')">
                 103 &#160; 0307
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Offentligrettsbiblioteket')">
                 103 &#160; 0003
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Petroleums- og EU-rettsbiblioteket')">
                 103 &#160; 0005
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Privatrettsbiblioteket')">
                 103 &#160; 0001
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Realfagsbiblioteket')">
                 103 &#160; 0310
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Rettshistorisk samling')">
                 103 &#160; 0015
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Rettsinformatikkbiblioteket')">
                 103 &#160; 0004
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Sjørettsbiblioteket')">
                 103 &#160; 0006
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Sophus Bugge')">
                 103 &#160; 0303
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Teologisk bibliotek')">
                 103 &#160; 0301
               </xsl:when>
               <xsl:when test="starts-with(calculated_destination_name, 'UiO Medisinsk bibliotek Ullevål sykehus')">
                 103 &#160; 0338
               </xsl:when>
               <xsl:otherwise>
                 <xsl:value-of select="calculated_destination_name" />
               </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:attribute>
        </xsl:element>
        
        <xsl:element name="meta">
          <xsl:attribute name="name">address</xsl:attribute>
          <xsl:attribute name="content">

            <xsl:for-each select="notification_data/request">
               <xsl:if test="contains(calculated_destination_name, 'UiO Juridisk bibliotek DJ')">
                 Juridisk bibliotek, DJ
               </xsl:if>
               <xsl:if test="contains(calculated_destination_name, 'UiO Juridisk magasinbygg DB')">
                 DB, postrom K16
               </xsl:if>
               <xsl:if test="contains(calculated_destination_name, 'UiO Rettshistorisk samling')">
                 RS, DB 1. etg
               </xsl:if>
               </xsl:for-each>
           </xsl:attribute>
        </xsl:element>
<!-- SKRIPTOTEKETS TILLEGG SLUTT -->



      </head>

      <body>
        <table width="1500">
        <tr>
          <td>
            <h2>Transit slip</h2>
          </td>
          <td>
            <h2><xsl:value-of select="notification_data/general_data/current_date"/></h2>
          </td>
        </tr>
          <!-- Hvis man skulle ønsker å teste på om boken skal sendes eller ikke:
            <xsl:if test="notification_data/destination = notification_data/organization_unit/name">
          -->
      </table>


      <!-- <xsl:attribute name="style"> -->
          <!-- <xsl:call-template name="bodyStyleCss" /> -->
          <!-- style.xsl -->

      <!--  </xsl:attribute> -->
        <!-- <xsl:call-template name="head" /> -->
        <!-- header.xsl -->
        <div class="messageArea">
          <div class="messageBody transitLetter">
            <table>
              <!--<tr>
                <td><b>@@print_date@@: </b>
                <xsl:value-of select="notification_data/request/create_date" /> -
                
                <xsl:value-of select="notification_data/request/create_time" /></td>
              </tr>
               -->
              <tr>
                <th>
                  <b>@@request_id@@: </b>
         </th>
         <td>
                  <img src="cid:request_id_barcode.png"
                  alt="Request Barcode" />
                </td>
              </tr>
              <tr>
                <th>
                  <b>@@item_barcode@@: </b>
        </th>
        <td>
                  <img src="cid:item_id_barcode.png"
                  alt="Item Barcode" />
                </td>
              </tr>
        <!--
              <tr>
                <td colspan="2">@@we_are_transferring_item_below@@</td>
              </tr>
        -->
<!--        <tr>
        <th><b>Tittel:</b></th>
        <td><xsl:call-template name="recordTitle"/></td>
        </tr>-->
        <xsl:if test="notification_data/phys_item_display/title">
          <tr>
          <th><b>Title: </b></th>
          <td>
          <xsl:value-of select="notification_data/phys_item_display/title" />
          </td>
          </tr>
        </xsl:if>
        <!--
              <tr>
                <th><b>@@transfer_date@@: </b></th>
        <td>
                <xsl:value-of select="notification_data/request/create_date" /> - 
             
               
                <xsl:value-of select="notification_data/request/create_time" /></td>
              </tr>
        -->
        <xsl:if test="notification_data/request/material_type_display">
          <tr>
          <th><b>@@material_type@@: </b></th>
          <td>
          <xsl:value-of select="notification_data/request/material_type_display" />
          </td>
          </tr>
        </xsl:if>
        <!--
              <xsl:if test="notification_data/user_for_printing/note">
                <tr>
                  <th>
                    <b>@@user_note@@:</b>
                  </th>
                  <td>
                    <xsl:value-of select="notification_data/user_for_printing/note" />
                  </td>
                </tr>
              </xsl:if>
        -->
       
              <xsl:if test="notification_data/request/system_notes != ''">
                <tr>
                  <th>
                    <b>@@system_notes@@:</b>
                  </th>
                  <td>
                    <xsl:value-of select="notification_data/request/system_notes" />
                  </td>
               </tr>
              </xsl:if>
              <xsl:if test="notification_data/user_for_printing/name">
                <tr>
                  <td valign="top">
                    <b>@@requested_for@@:</b>
                  </td>
                  <td>
                    <xsl:value-of select="notification_data/user_for_printing/identifiers/code_value[1]/value"/>
                    :
                    <xsl:value-of select="notification_data/user_for_printing/name" />
                    <xsl:if test="notification_data/request/user_group = '4'">
                      <h1>(egne ansatte)</h1>
                    </xsl:if>
                  </td>
                </tr>
                <!--
                <xsl:if test="notification_data/user_for_printing/email">
                  <tr>
                    <td><b>@@email@@: </b>
                    <xsl:value-of select="notification_data/user_for_printing/email" /></td>
                  </tr>
                </xsl:if>
                <xsl:if test="notification_data/user_for_printing/phone">
                  <tr>
                    <td><b>@@tel@@: </b>
                    <xsl:value-of select="notification_data/user_for_printing/phone" /></td>
                  </tr>
                </xsl:if>
                <tr>
                  <td><b>@@request_date@@: </b>
                  <xsl:value-of select="notification_data/request/create_date" /></td>
                </tr>
                <xsl:if test="notification_data/request/lastInterestDate">
                  <tr>
                    <td><b>@@expiration_date@@: </b>
                    <xsl:value-of select="notification_data/request/lastInterestDate" /></td>
                  </tr>
                </xsl:if>
                -->
              </xsl:if>
              <xsl:if test="notification_data/request/note != ''">
                <tr>
                  <th>
                    <b>@@user_note@@:</b>
                  </th>
                  <td>
                    <xsl:value-of select="notification_data/request/note" />
                  </td>
               </tr>
              </xsl:if>
        <!-- <xsl:if test="notification_data/phys_item_display/owning_library_name">
                  <tr>
                    <td><b>@@owning_library@@: </b>
                    <xsl:value-of select="notification_data/phys_item_display/owning_library_name" /></td>
                  </tr>
                </xsl:if>
        -->
            </table>
      <hr />
            <table>
              <tr>
                <th><b>@@from@@: </b>
        </th>
        <td>
                <xsl:value-of select="notification_data/request/assigned_unit_name" />
        </td>        
        </tr>
        <tr>
        <th><b>@@to@@: </b></th>
        <td>
                <xsl:value-of select="notification_data/request/calculated_destination_name" />
        </td>
              </tr>
            </table>
          </div>
        </div>
    
    
    

        <!-- recordTitle.xsl -->
 <!--       <xsl:call-template name="lastFooter" />
 -->
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
