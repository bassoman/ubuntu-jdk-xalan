<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="build-menu">
        <xsl:for-each select="website/menu/item">
            <table bgcolor="#C0C0C0">
                <xsl:for-each select="/brokerage/website/menu/item">
                    <xsl:if test="not($pagename=@URI)">
                        <tr>
                            <td>
                                <a href="{@URI}">
                                    <font style="font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#000000;">
                                        <xsl:value-of select="@desc"/>
                                    </font>
                                </a>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
