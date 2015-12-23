<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="Layout.xsl"/>
    <xsl:template match="/">
        <xsl:apply-templates select="page/body"/>
    </xsl:template>
    <xsl:template match="page/body[@style='format_1']">
        <xsl:variable name="ads_span">
            <xsl:choose>
                <xsl:when test="@ads='yes'">
                    <xsl:value-of select="3"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="2"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="border_size">
            <xsl:choose>
                <xsl:when test="/page/business/website/@borders='yes'">
                    <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <html>
            <xsl:call-template name="html-head"/>
            <body>
                <table border="{$border_size}" cellpadding="10" width="700">
                    <tr>
                        <td colspan="{$ads_span}">
                            <xsl:call-template name="apply-header"/>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" width="130">
                            <xsl:call-template name="apply-leftbar"/>
                        </td>
                        <td valign="top">
                            <xsl:call-template name="apply-body"/>
                        </td>
                        <xsl:if test="$ads_span='3'">
                            <td valign="top" width="100">
                                <xsl:call-template name="apply-rightbar"/>
                            </td>
                        </xsl:if>
                    </tr>
                    <tr>
                        <td colspan="{$ads_span}">
                            <xsl:call-template name="apply-footer"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
