<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Detalles de Pedidos</title>
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
            <th>Fecha de Entrega</th>
            <th>Total de la Factura</th>
            <th>Productos</th>
          </tr>
          <xsl:for-each select="pedidos/año/trimestre/pedido">
            <tr>
              <td><xsl:value-of select="detalle_pedido/numero_pedido"/></td>
              <td><xsl:value-of select="detalle_pedido/fecha_compra"/></td>
              <td><xsl:value-of select="detalle_pedido/fecha_entrega"/></td>
              <td><xsl:value-of select="detalle_pedido/total_factura"/></td>
              <td>
                <ul>
                  <xsl:for-each select="detalle_pedido/productos/producto">
                    <li>
                      <xsl:value-of select="nombre"/>
                      (Ref: <xsl:value-of select="referencia"/>,
                      Precio: <xsl:value-of select="precio"/>,
                      Unidades: <xsl:value-of select="unidades"/>)
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
