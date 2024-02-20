<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Detalle de los clientes</title>
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
            <th>Nombre del Cliente</th>
            <th>Apellidos del Cliente</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Correo Electrónico</th>
          </tr>
          <xsl:for-each select="pedidos/año/trimestre/pedido">
            <tr>
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
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
