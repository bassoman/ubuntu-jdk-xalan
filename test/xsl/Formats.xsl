<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="quote"/>
    <xsl:template match="heading[@type='normal-big']">
        <p align="left" style="font-family: Arial, Helvetica;font-size:18px;text-decoration:none;color:#3333ff;">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="heading[@type='special-big']">
        <p align="left" style="font-family: Arial, Helvetica;font-size:18px;text-decoration:none;color:#ff0000;">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="heading[@type='normal-medium']">
        <p align="left" style="font-family: Arial, Helvetica;font-size:16px;text-decoration:none;color:#3333ff;">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="heading[@type='special-medium']">
        <p align="left" style="font-family: Arial, Helvetica;font-size:16px;text-decoration:none;color:#ff0000;">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="para">
        <p align="left" style="font-family: Arial, Helvetica;font-size:14px;text-decoration:none;color:#000000;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="strong">
        <strong>
            <xsl:value-of select="."/>
        </strong>
    </xsl:template>
    <xsl:template match="br">
        <br/>
    </xsl:template>
    <xsl:template match="bullets">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="slug">
        <li>
            <!--style="font-family: Arial, Helvetica;font-size:14px;text-decoration:none;color:#000000;"-->
            <font style="{//bullets/@style}">
                <xsl:value-of select="."/>
            </font>
        </li>
    </xsl:template>
    <!--    <xsl:template match="@*|*|text()" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|*|text()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@*|node()" priority="-2">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>-->
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
