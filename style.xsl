<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="UTF-8"/>
				<title>Guided Learning Records</title>
				<style>
					body { font-family: Arial, sans-serif; max-width: 800px; margin: 20px auto; padding: 0 20px; background: #f5f5f5; }
					h1 { text-align: center; color: #2c3e50; }
					.record { border: 1px solid #ccc; margin: 15px 0; padding: 15px; border-radius: 8px; background: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
					.language { font-size: 1.4em; font-weight: bold; color: #2c3e50; }
					.description { margin: 8px 0; font-style: italic; color: #666; }
					.grades { margin-top: 10px; display: flex; gap: 20px; }
					.grade { padding: 4px 12px; border-radius: 4px; font-size: 0.95em; }
					.available { color: #27ae60; font-weight: bold; }
					.not-available { color: #e74c3c; }
					footer { margin-top: 30px; text-align: center; font-size: 0.85em; border-top: 1px solid #ccc; padding-top: 15px; color: #888; }
				</style>
			</head>
			<body>
				<h1>Guided Learning Records</h1>
				<!-- 只显示 type="guided" 的记录，按 language 首字母升序排列 -->
				<xsl:for-each select="records/record[@type='guided']">
					<xsl:sort select="language" order="ascending"/>
					<div class="record">
						<div class="language">
							<xsl:value-of select="language"/>
						</div>
						<div class="description">
							<xsl:value-of select="description"/>
						</div>
						<div class="grades">
							<xsl:for-each select="grades/result">
								<div class="grade">
									<xsl:value-of select="@level"/>:
									<xsl:choose>
										<xsl:when test=". = 'ACHIEVED'">
											<span class="available">Available</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="not-available">Not Available</span>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</xsl:for-each>
						</div>
					</div>
				</xsl:for-each>
				<footer>
					<p>&#xA9; College Productions Ltd</p>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
