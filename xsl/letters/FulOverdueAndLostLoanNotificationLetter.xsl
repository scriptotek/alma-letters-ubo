<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
 <html>
  <head>
  <xsl:call-template name="generalStyle" />
  </head>

   <body>
   <xsl:attribute name="style">
    <xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
   </xsl:attribute>

    <xsl:call-template name="head" /> <!-- header.xsl -->
    <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

    <br />


    <table cellspacing="0" cellpadding="5" border="0">
    <tr>
    <td>
     <p>@@inform_you_item_below@@ </p>
     <p>@@borrowed_by_you@@ @@decalred_as_lost@@</p>
    </td>
    </tr>
    </table>

    <table cellpadding="5" class="listing">
    <xsl:attribute name="style">
     <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
    </xsl:attribute>




    <table cellpadding="5" class="listing">
    <xsl:attribute name="style">
     <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
    </xsl:attribute>
     <tr>
      <th>@@lost_item@@</th>
      <th>@@description@@</th>
      <th>@@library@@</th>
      <th>@@loan_date@@</th>
      <th>@@due_date@@</th>
      <th>@@barcode@@</th>
      <th>@@call_number@@</th>
      <th>@@charged_with_fines_fees@@</th>
     </tr>
     <xsl:for-each select="notification_data/display_list/overdue_and_lost_loan_notification_display">
     <tr>
      <td><xsl:value-of select="item_loan/title"/></td>
      <td><xsl:value-of select="item_loan/description"/></td>
      <td><xsl:value-of select="physical_item_display_for_printing/library_name"/></td>
      <td><xsl:value-of select="item_loan/loan_date"/></td>
      <td><xsl:value-of select="item_loan/due_date"/></td>
      <td><xsl:value-of select="item_loan/barcode"/></td>
      <td><xsl:value-of select="physical_item_display_for_printing/call_number"/></td>
      <td>
       <xsl:for-each select="fines_fees_list/user_fines_fees">
        <b><xsl:value-of select="fine_fee_type_display"/>: </b><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>&#160;<xsl:value-of select="ff"/>
        <br />
       </xsl:for-each>
      </td>
     </tr>
     </xsl:for-each>

    </table>

    <br />
    <br />
    @@additional_info_1@@
    <br />
    @@additional_info_2@@
    <br />
    </table>
    <br />

    <xsl:call-template name="email-footer"><!-- footer.xsl -->
      <xsl:with-param name="show_my_account" select="true()"/>
    </xsl:call-template>

   </body>
 </html>
</xsl:template>

</xsl:stylesheet>