<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Factura</title>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <table class="table table-hover">
          <tr>
            <th>Número de Pedido</th>
            <th>Fecha de Compra</th>
            <th>Nombre del Cliente</th>
            <th>Apellidos del Cliente</th>
            <th>Teléfono</th>
            <th>Provincia</th>
            <th>Referencia del Producto</th>
            <th>Nombre del Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
          </tr>
          <xsl:for-each select="pedidos/año[@year='2022']/trimestre/pedido[detalle_pedido/numero_pedido='2484']">
            <tr>
              <td><xsl:value-of select="detalle_pedido/numero_pedido"/></td>
              <td><xsl:value-of select="detalle_pedido/fecha_compra"/></td>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="apellidos"/></td>
              <td><xsl:value-of select="telefono"/></td>
              <td><xsl:value-of select="direccion/provincia"/></td>
              <td>
                <xsl:for-each select="detalle_pedido/productos/producto">
                  <xsl:value-of select="referencia"/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="detalle_pedido/productos/producto">
                  <xsl:value-of select="nombre"/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="detalle_pedido/productos/producto">
                  <xsl:value-of select="unidades"/>
                  <br/>
                </xsl:for-each>
              </td>
              <td>
                <xsl:for-each select="detalle_pedido/productos/producto">
                  <xsl:value-of select="precio"/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
          <tr>
            <td colspan="9" style="text-align:right;"><b>Total de la Factura:</b></td>
            <td>
              <xsl:value-of select="pedidos/año[@year='2022']/trimestre/pedido[detalle_pedido/numero_pedido='2484']/detalle_pedido/total_factura"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
