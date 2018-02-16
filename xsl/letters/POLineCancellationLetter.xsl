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

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->

        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
    <tr>
     <td><b> @@introduction@@ </b>
     <br />
     <br />
     <b>@@title@@: </b><xsl:value-of select="notification_data/line/title" />
     <br />
     <b>@@order_number@@: </b><xsl:value-of select="notification_data/line/reference_number" />
     <br />
     <b>@@order_date@@: </b><xsl:value-of select="notification_data/line/send_date" />
     <br />
     <b>@@cancellation_reason@@: </b><xsl:value-of select="notification_data/line/cancellation_reason" />
     <br />
     </td>
    </tr>
   </table>
          </div>
        </div>
  <xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>