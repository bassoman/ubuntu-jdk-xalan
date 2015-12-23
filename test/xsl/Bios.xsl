<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="bios">
        <!--        <table border="0" width="100%">
            <xsl:for-each select="/page/business/office">
                <tr>
                    <td>
                        <xsl:value-of select="@name"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
-->
        <p>
            <font style="font-family: Arial, Helvetica;font-size:16px;text-decoration:none;color:#000000;">
                <strong>
                    <xsl:value-of select="/page/business/@biz_name"/>
                </strong>
            </font>
        </p>
        <xsl:for-each select="/page/business/office">
            <p>
                <table width="80%">
                    <tr valign="top">
                        <td style="font-family: Arial, Helvetica;font-size:14px;text-decoration:none;color:#000000;">
                            <xsl:value-of select="@name"/>
                        </td>
                        <td style="font-family: Arial, Helvetica;font-size:14px;text-decoration:none;color:#000000;">
                            <xsl:for-each select="address/street">
                                <xsl:value-of select="@line"/>
                                <br/>
                            </xsl:for-each>
                            <xsl:value-of select="concat(address/@city,', ',address/@state,' ',address/@zip)"/>
                        </td>
                    </tr>
                </table>
            </p>
            <table border="0" cellspacing="8" width="100%">
                <xsl:for-each select="personnel/emp">
                    <tr>
                        <xsl:if test="/page/body/bios[@pics='yes']">
                            <td/>
                        </xsl:if>
                        <td>
                            <xsl:if test="not(/page/business/website/@borders='yes')">
                                <hr/>
                            </xsl:if>
                        </td>
                    </tr>
                    <tr>
                        <xsl:if test="/page/body/bios[@pics='yes']">
                            <td rowspan="2" valign="top" width="200">
                                <xsl:variable name="image_file">
                                    <xsl:value-of select="/page/business/website/repository[@type='images']/@URI"/>
                                    <xsl:value-of select="@image"/>
                                </xsl:variable>
                                <img alt="Missing {$image_file}" src="{$image_file}"/>
                            </td>
                        </xsl:if>
                        <td height="20%" valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td valign="top" width="50%">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                  <strong>
                                                  <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#000000;">
                                                  <a href="mailto:{email/@user}">
                                                  <xsl:value-of select="@name"/>
                                                  </a>
                                                  </font>
                                                  </strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                  <strong>
                                                  <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#000000;">
                                                  <xsl:value-of select="@title"/>
                                                  </font>
                                                  </strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <xsl:for-each select="telephone">
                                                <tr>
                                                  <td>
                                                  <table width="100%">
                                                  <tr>
                                                  <td width="50%" style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#993300;">
                                                  <xsl:value-of select="@type"/>
                                                  </td>
                                                  <td width="50%" style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#993300;">
                                                  <xsl:value-of select="@number"/>
                                                  </td>
                                                  </tr>
                                                  </table>
                                                  <!--                                                  <strong>
                                                  <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#993300;">
                                                  <xsl:value-of select="concat(@type,' ',@number)"/>
                                                  </font>
                                                  </strong>-->
                                                  </td>
                                                </tr>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <tr>
                            <xsl:choose>
                                <xsl:when test="/page/body/bios[@pics='yes']">
                                    <td align="justify" valign="top" width="50%">
                                        <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#000000;">
                                            <!--                                            <xsl:value-of select="biography/."/>-->
                                            <xsl:apply-templates select="biography/."/>
                                        </font>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td width="25%"/>
                                                <td align="justify" valign="top" width="75%">
                                                  <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#000000;">
                                                  <xsl:apply-templates select="biography/."/>
                                                  <!--                                                  <xsl:value-of select="biography/."/>-->
                                                  </font>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </tr>
                </xsl:for-each>
                <tr>
                    <xsl:if test="/page/body/bios[@pics='yes']">
                        <td/>
                    </xsl:if>
                    <td>
                        <xsl:if test="not(/page/business/website/@borders='yes')">
                            <hr/>
                        </xsl:if>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
