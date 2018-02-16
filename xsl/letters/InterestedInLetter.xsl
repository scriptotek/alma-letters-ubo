<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
    @@You_were_specify@@:
  </p>

  <p>
    <em><xsl:value-of  select="title"/></em>
  </p>

  <xsl:if test="message != 'Item was received.'">
    <!-- Not yet sure what other values this field can take, but show it just in case it's something important. -->
    <p>
      <xsl:value-of  select="message"/>
    </p>
  </xsl:if>

  <xsl:call-template name="email-footer" /><!-- footer.xsl -->

</xsl:template>
</xsl:stylesheet>