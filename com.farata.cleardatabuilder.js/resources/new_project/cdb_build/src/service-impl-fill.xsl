<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xalan="http://xml.apache.org/xslt" exclude-result-prefixes="xalan"
	xmlns:helper="xalan://com.farata.cdb.annotations.helper.AnnotationsHelper">
	
	<xsl:output omit-xml-declaration="yes" method="text"/>	
	
	<xsl:template match="/|/|/" name="service-impl-fill.xsl">
		<xsl:param name="interfaceName"/>
		<xsl:param name="methodNode"/>
		<xsl:param name="springEnabled"/>

		<xsl:variable name="javaFillMethod" select="helper:getMethodAnnotation($interfaceName, $methodNode/@name, 'clear.cdb.annotations.CX_FillMethod')"/>
		<xsl:variable name="javaAutoSyncEnabled" select="boolean($javaFillMethod/method[@name='autoSyncEnabled']/@value = 'true')"/>
		<xsl:variable name="javaSync" select="boolean($javaFillMethod/method[@name='sync']/@value = 'true')"/>
	public <xsl:value-of select="$methodNode/@to-string"/> {
		return null;
	}
		<xsl:if test="$javaSync">
 	public List&lt;ChangeObject&gt; <xsl:value-of select="$methodNode/@name"/>_sync(List&lt;ChangeObject&gt; items) throws Exception {
 		try {
	 		UserTransactionManager.joinUserTransaction();
	 		<xsl:value-of select="$methodNode/@name"/>_deleteItems(items);
	 		<xsl:value-of select="$methodNode/@name"/>_updateItems(items);
	 		<xsl:value-of select="$methodNode/@name"/>_insertItems(items);
	 		UserTransactionManager.commitUserTransaction();
	 	} catch (Throwable e) {
			try {
				UserTransactionManager.rollbackUserTransaction();
			} catch (Throwable th) {
				throw new RuntimeException(th);
			}
			throw new RuntimeException(e);
		}
			<xsl:if test="$javaAutoSyncEnabled">
		MessagingUtils.pushChanges("<xsl:value-of select="$interfaceName"/>.<xsl:value-of select="$methodNode/@name"/>", items);
			</xsl:if>
 		return items;
 	}

	public List&lt;ChangeObject&gt; <xsl:value-of select="$methodNode/@name"/>_insertItems(List&lt;ChangeObject&gt; items) throws Exception {
        List&lt;ChangeObject&gt; list = new ArrayList&lt;ChangeObject&gt;();
        for (ChangeObject changeObject:items) {
            if(changeObject.isCreate()) {
            	<xsl:value-of select="$methodNode/@name"/>_doCreate(changeObject);
            	list.add(changeObject);
            }	       	
        }
			<xsl:if test="$javaAutoSyncEnabled">
		MessagingUtils.pushChanges("<xsl:value-of select="$interfaceName"/>.<xsl:value-of select="$methodNode/@name"/>", list);
			</xsl:if>
		return list;
	} 	

	public List&lt;ChangeObject&gt; <xsl:value-of select="$methodNode/@name"/>_updateItems(List&lt;ChangeObject&gt; items) throws Exception {
        List&lt;ChangeObject&gt; list = new ArrayList&lt;ChangeObject&gt;();
        for (ChangeObject changeObject:items) {
            if(changeObject.isUpdate()) {
            	<xsl:value-of select="$methodNode/@name"/>_doUpdate(changeObject);
            	list.add(changeObject);
            }	       	
        }
			<xsl:if test="$javaAutoSyncEnabled">
		MessagingUtils.pushChanges("<xsl:value-of select="$interfaceName"/>.<xsl:value-of select="$methodNode/@name"/>", list);
			</xsl:if>
		return list;
	} 	

	public List&lt;ChangeObject&gt; <xsl:value-of select="$methodNode/@name"/>_deleteItems(List&lt;ChangeObject&gt; items) throws Exception {
        List&lt;ChangeObject&gt; list = new ArrayList&lt;ChangeObject&gt;();
        for (ChangeObject changeObject:items) {
            if(changeObject.isDelete()) {
            	<xsl:value-of select="$methodNode/@name"/>_doDelete(changeObject);
            	list.add(changeObject);
            }	       	
        }
			<xsl:if test="$javaAutoSyncEnabled">
		MessagingUtils.pushChanges("<xsl:value-of select="$interfaceName"/>.<xsl:value-of select="$methodNode/@name"/>", list);
			</xsl:if>
		return list;
	} 	

	public void <xsl:value-of select="$methodNode/@name"/>_doCreate(ChangeObject changeObject) {
	}
	
	public void <xsl:value-of select="$methodNode/@name"/>_doUpdate(ChangeObject changeObject) {
	}

	public void <xsl:value-of select="$methodNode/@name"/>_doDelete(ChangeObject changeObject) {
	}
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>