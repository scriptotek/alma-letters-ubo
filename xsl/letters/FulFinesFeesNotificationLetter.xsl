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

<xsl:template match="/">
  <xsl:call-template name="emailTemplate"/><!-- style.xsl -->
</xsl:template>

<xsl:template match="/notification_data">

  <xsl:call-template name="emailLogo"/><!-- mailReason.xsl -->
  <xsl:call-template name="toWhomIsConcerned"/><!-- mailReason.xsl -->

  <p>
    @@we_would_like@@ <xsl:value-of select="organization_unit/name"/> @@debt_of@@
    <b><xsl:value-of select="total_fines_amount"/>
    &#160;<xsl:value-of select="total_fines_currency"/></b>
  </p>

  <table cellpadding="5" cellspacing="0" class="listing" width="100%">
    <tr>
      <th align="left">@@fee_type@@</th>
      <th align="right">@@fee_amount@@</th>
      <th align="left"></th>
    </tr>
    <xsl:for-each select="fines_fees_list/user_fines_fees">
      <tr>
        <td><xsl:value-of select="fine_fee_type_display"/></td>
        <td align="right"><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
        <td><xsl:value-of select="fine_comment"/></td>
      </tr>
    </xsl:for-each>
  </table>

  <xsl:if test="notification_data/fine_fee_notification_fee_amount/sum !=''">
    <p>
      <b>@@fine_fee_notification_fee@@ </b>
      <xsl:value-of select="notification_data/fine_fee_notification_fee_amount/sum"/>&#160;<xsl:value-of select="notification_data/fine_fee_notification_fee_amount/currency"/>&#160;<xsl:value-of select="ff"/>
    </p>
  </xsl:if>

  <p>
    <b>@@please_settle@@</b>
  </p>

  <xsl:call-template name="email-footer"/><!-- footer.xsl -->

</xsl:template>
</xsl:stylesheet>