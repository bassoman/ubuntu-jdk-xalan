<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="Formats.xsl"/>
    <xsl:include href="Bios.xsl"/>
    <xsl:template name="html-head">
        <head>
            <title>
                <xsl:value-of select="/page/business/@biz_name"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="/page/business/website/menu[@name=//page/body/@menu]/item[@URI=//page/body/@name]/@desc"/>
            </title>
            <meta>
                <xsl:attribute name="HTTP-EQUIV">Refresh</xsl:attribute>
            </meta>
            <meta>
                <xsl:attribute name="name">description</xsl:attribute>
                <xsl:attribute name="value">
                    <xsl:value-of select="/page/business/website/menu[@name=//page/body/@menu]/item[@URI=//page/body/@name]/@page_desc"/>
                </xsl:attribute>
            </meta>
            <meta>
                <xsl:attribute name="name">keywords</xsl:attribute>
                <xsl:attribute name="value">
                    <xsl:value-of select="/page/business/website/menu[@name=//page/body/@menu]/item[@URI=//page/body/@name]/@keywords"/>
                </xsl:attribute>
            </meta>
        </head>
    </xsl:template>
    <xsl:template name="apply-header">
        <xsl:variable name="image_file">
            <xsl:if test="//page/body[@style='format_1']">
                <xsl:value-of select="/page/business/website/repository[@type='images']/@URI"/>
                <xsl:value-of select="/page/business/website/header/image/@name"/>
            </xsl:if>
        </xsl:variable>
       <center>
            <img src="{$image_file}"/>
        </center>

    </xsl:template>
    <xsl:template name="apply-leftbar">
        <xsl:call-template name="apply-menu"/>
    </xsl:template>
    <xsl:template name="apply-rightbar">
        <center>ADS</center>
    </xsl:template>
    <xsl:template name="apply-footer">
        <center>
            <font style="font-family: Arial, Helvetica;font-size:14px;text-decoration:none;color:#444444;">
                <xsl:value-of select="/page/business/@biz_name"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="/page/business/office[@type='HQ']/address/@city"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="/page/business/office[@type='HQ']/address/@state"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="/page/business/office[@type='HQ']/address/@country"/>
            </font>
            <br/>
            <xsl:text> - </xsl:text>
            <xsl:for-each select="/page/business/website/menu/item">
                <xsl:if test="not(/page/body/@name=@URI)">
                    <a href="{@URI}">
                        <font style="font-family: Arial, Helvetica;font-size:10px;text-decoration:none;color:#000000;">
                            <xsl:value-of select="@desc"/>
                        </font>
                    </a>
                    <xsl:text> - </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </center>
    </xsl:template>
    <xsl:template name="apply-body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template name="apply-menu">
        <table border="0">
            <xsl:call-template name="apply-menuitems">
                <xsl:with-param name="items" select="/page/business/website/menu"/>
                <xsl:with-param name="indent" select="''"/>
                <xsl:with-param name="font-style" select="'font-family: Arial, Helvetica;font-size:12px;text-decoration:none;color:#993300;'"/>
            </xsl:call-template>
        </table>
    </xsl:template>
    <xsl:template name="apply-menuitems">
        <xsl:param name="items"/>
        <xsl:param name="indent"/>
        <xsl:param name="font-style"/>
        <xsl:for-each select="$items/item">
            <xsl:if test="not(//page/body/@name=@URI)">
                <tr>
                    <td>
                        <xsl:value-of select="concat($indent,'')"/>
                        <a href="{@URI}">
                            <font style="{$font-style}">
                                <xsl:value-of select="@desc"/>
                            </font>
                        </a>
                    </td>
                </tr>
                <xsl:if test=".//@URI=//page/body/@name">
                    <xsl:call-template name="apply-menuitems">
                        <xsl:with-param name="items" select="."/>
                        <xsl:with-param name="indent" select="concat($indent,'--')"/>
                        <xsl:with-param name="font-style" select="'font-family: Arial, Helvetica;font-size:10px;text-decoration:none;color:#ff6600;'"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
