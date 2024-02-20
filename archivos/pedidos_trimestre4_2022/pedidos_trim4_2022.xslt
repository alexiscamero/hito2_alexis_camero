<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Pedidos del cuarto trimestre del 2022</title>
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
            <th>Año</th>
            <th>Trimestre</th>
            <th>Nombre del Cliente</th>
            <th>Apellidos del Cliente</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Correo Electrónico</th>
            <th>Número de Pedido</th>
            <th>Fecha de Compra</th>
            <th>Fecha de Entrega</th>
            <th>Total de la Factura</th>
            <th>Productos</th>
          </tr>
          <xsl:for-each select="pedidos/año/trimestre/pedido">
            <xsl:if test="../../@year = 2022 and ancestor::trimestre//@num = 4">
             <tr>
              <td><xsl:value-of select="../../@year"/></td>
              <td><xsl:value-of select="ancestor::trimestre//@num"/></td>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="apellidos"/></td>
              <td><xsl:value-of select="telefono"/></td>
              <td>
                <xsl:value-of select="direccion/calle"/>,
                <xsl:value-of select="direccion/ciudad"/>,
                <xsl:value-of select="direccion/codigo_postal"/>,
                <xsl:value-of select="direccion/provincia"/>
              </td>
              <td><xsl:value-of select="correo"/></td>
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
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
