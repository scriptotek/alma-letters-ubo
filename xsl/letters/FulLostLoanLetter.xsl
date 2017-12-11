<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl"/>
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
  <xsl:call-template name="email-template"/><!-- header.xsl -->
</xsl:template>

<xsl:template match="/notification_data">

  <xsl:call-template name="emailLogo"/><!-- mailReason.xsl -->
  <xsl:call-template name="toWhomIsConcerned"/><!-- mailReason.xsl -->

  <p>
    @@inform_you_item_below@@
  </p>

  <div style="margin: 0.8em 1.2em;">
    <em>
      <xsl:value-of select="phys_item_display/title_abcnph"/>
    </em>
    <br />
    <xsl:if test="item_loan/description != ''">
      @@description@@: <xsl:value-of select="item_loan/description"/>
      <br />
    </xsl:if>
    @@library@@: <xsl:value-of select="organization_unit/name"/>
    <br />
    @@loan_date@@: <xsl:value-of select="item_loan/loan_date"/>
    <br />
    @@due_date@@: <xsl:value-of select="item_loan/due_date"/>
    <br />
    @@barcode@@: <xsl:value-of select="item_loan/barcode"/>
  </div>

  <p>
    @@charged_with_fines_fees@@
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
        <td><xsl:value-of select="ff"/></td>
      </tr>
    </xsl:for-each>
  </table>

  <p>
    <xsl:call-template name="multilingual"><!-- footer.xsl -->
      <xsl:with-param name="nb" select="'Du kan betale i biblioteket eller med '"/>
      <xsl:with-param name="nn" select="'Du kan betale i biblioteket eller med '"/>
      <xsl:with-param name="en" select="'You can pay at the library or with '"/>
    </xsl:call-template>
    <a><xsl:attribute name="href">https://epay.uio.no/pay/shop/order-create.html?projectStepId=5203685</xsl:attribute>Epay</a>.
  </p>

  <p>
    <xsl:call-template name="multilingual"><!-- footer.xsl -->
      <xsl:with-param name="nb" select="'Hvis du betaler med Epay, skriv inn DokumentID i kommentarfeltet.'"/>
      <xsl:with-param name="nn" select="'Om du betalar med Epay, skriv inn DokumentID i kommentarfeltet.'"/>
      <xsl:with-param name="en" select="'If you use Epay, please write the DocumentID in the comment field.'"/>
    </xsl:call-template>
  </p>

  <xsl:call-template name="email-footer"><!-- footer.xsl -->
    <xsl:with-param name="show_my_account" select="true()"/>
  </xsl:call-template>

</xsl:template>

</xsl:stylesheet>