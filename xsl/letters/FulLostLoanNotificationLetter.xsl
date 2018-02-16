<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns:ext="http://exslt.org/common"
  extension-element-prefixes="date ext">
<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl"/>
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
  <xsl:call-template name="emailTemplate"/><!-- style.xsl -->
</xsl:template>

<xsl:template match="/notification_data">

  <xsl:call-template name="dearLibraryPatron"/><!-- mailReason.xsl -->

  <p>
    <xsl:choose>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType1' and /notification_data/phys_item_display/item_policy = 'Innlan Utland'">
        @@inform_you_item_below_type4@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType1'">
        @@inform_you_item_below_type1@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType2' and /notification_data/phys_item_display/item_policy = 'Innlan Utland'">
        @@inform_you_item_below_type4@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType2'">
        @@inform_you_item_below_type2@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType3'">
        @@inform_you_item_below_type3@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType4'">
        @@inform_you_item_below_type4@@
      </xsl:when>
      <xsl:otherwise><!-- This should never happen --></xsl:otherwise>
    </xsl:choose>
  </p>

  <div style="margin: 0.8em 1.2em;">

    <em><xsl:value-of select="phys_item_display/title_abcnph"/></em><br />

    @@barcode@@: <xsl:value-of select="item_loan/barcode"/><br />

    <!-- BEGIN: Extremely crappy workaround for https://github.com/scriptotek/alma-slipsomat/issues/9 -->
    <xsl:if test="phys_item_display/chron_i != ''"><!-- Warning: We assume `chron_i` is always used. Is it? -->
      Issue: <xsl:value-of select="phys_item_display/enum_a"/>

      <xsl:if test="phys_item_display/chron_i != '' and phys_item_display/enum_a != ''">&#160;(</xsl:if>
      <xsl:value-of select="phys_item_display/chron_i"/>
      <xsl:if test="phys_item_display/chron_i != '' and phys_item_display/enum_a != ''">)</xsl:if>

      <xsl:if test="phys_item_display/chron_i != '' and phys_item_display/enum_a = ''">&#160;(</xsl:if>
      <xsl:value-of select="phys_item_display/enum_b"/>
      <xsl:if test="phys_item_display/chron_i != '' and phys_item_display/enum_a = ''">)</xsl:if>
      <br />
    </xsl:if>
    <!-- END: Extremely crappy workaround for https://github.com/scriptotek/alma-slipsomat/issues/9 -->

    <xsl:if test="item_loan/description != ''">
      @@description@@: <xsl:value-of select="item_loan/description"/><br />
    </xsl:if>

    <!--
    <xsl:if test="item_loan/author != ''">
      @@by@@: <xsl:value-of select="item_loan/author"/><br />
    </xsl:if>
    -->

  </div>

  <!--Beskjed type i forhold til hvilken purringtype -->
  <p>
    <xsl:choose>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType1' and /notification_data/phys_item_display/item_policy = 'Innlan Utland'">
        @@decalred_as_lost_type5@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType1'">
        @@decalred_as_lost_type1@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType2' and /notification_data/phys_item_display/item_policy = 'Innlan Utland'">
        <xsl:attribute name="style">color: #cc0000; padding: 5px 0; border-top: 1px solid #cc0000; border-bottom: 1px solid #cc0000;</xsl:attribute>
        @@decalred_as_lost_type4@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType2'">
        <xsl:attribute name="style">color: #cc0000; padding: 5px 0; border-top: 1px solid #cc0000; border-bottom: 1px solid #cc0000;</xsl:attribute>
        @@decalred_as_lost_type2@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType3'">
        <xsl:attribute name="style">color: #cc0000; padding: 5px 0; border-top: 1px solid #cc0000; border-bottom: 1px solid #cc0000;</xsl:attribute>
        @@decalred_as_lost_type3@@
      </xsl:when>
      <xsl:when test="/notification_data/notification_type = 'OverdueNotificationType4'">
        <xsl:attribute name="style">color: #cc0000; padding: 5px 0; border-top: 1px solid #cc0000; border-bottom: 1px solid #cc0000;</xsl:attribute>
        @@decalred_as_lost_type4@@
      </xsl:when>
      <xsl:otherwise><!-- This should never happen --></xsl:otherwise>
    </xsl:choose>
  </p>

  <div>@@additional_info_1@@</div>
  <div>@@additional_info_2@@</div>

  <xsl:call-template name="email-footer"><!-- footer.xsl -->
    <xsl:with-param name="show_my_account" select="true()"/>
  </xsl:call-template>

</xsl:template>
</xsl:stylesheet>