<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version=“1.0” xmlns:xsl=“http://www.w3.org/1999/XSL/Transform”>
<xsl:output method=“html” indent=“yes” encoding=“UTF-8”/>

<!-- Match the root node catalog -->
<xsl:template match=“/catalog”>
<html>
<head>
<title>Book Catalog
<style>
body { font-family: Arial, sans-serif; }
table { border-collapse: collapse; width: 80%; margin: 20px auto; }
th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
th { background-color: #f2f2f2; }
tr:nth-child(even) { background-color: #f9f9f9; }


<body>
<h1 style="text-align: center;">Book Catalog
<table>
<tr>
<th>Title
<th>Author
<th>Genre
<th>Price

<!-- Iterate over all book elements -->
<xsl:for-each select=“book”>
<tr>
<td><xsl:value-of select=“title”/>
<td><xsl:value-of select=“author”/>
<td><xsl:value-of select=“genre”/>
<td>$<xsl:value-of select=“price”/>

</xsl:for-each>



</xsl:template>

</xsl:stylesheet>
