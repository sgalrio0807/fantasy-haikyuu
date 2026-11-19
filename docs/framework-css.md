# 7. Elección del Framework CSS — Fantasy Haikyuu

## Comparativa de opciones

| Opción | Cómo funciona | A favor | En contra |
| **Bootstrap 5** | Sistema de rejilla de 12 columnas y componentes preconstruidos con clases semánticas y variables CSS personalizables. | Rápido de empezar, diseño *responsive* nativo y componentes listos (navbars, tarjetas, formularios y modales como el de confirmación de fichaje). | Sin personalizar variables todas las webs se parecen. |
| **Tailwind CSS** | Clases pequeñas de utilidad que se combinan directamente en el HTML. | Muy fiel al diseño de Figma sin salir del HTML. | Llena el HTML de clases y requiere configurar compilación. |
| **CSS propio** | Hojas de estilo escritas manualmente desde cero. | Control total sin librerías externas. | Desarrollo mucho más lento. |

## Decisión tomada

Se ha elegido **Bootstrap 5** combinado con una hoja de estilos propia (`frontend/css/custom.css`) donde se redefinen sus variables CSS para adaptar el tema oscuro (`#141414` y `#1F1F1F`), el color primario naranja (`#F96316`) y la tipografía sans-serif de nuestra guía de estilo de Figma. De este modo aprovechamos su sistema *responsive*, formularios, tarjetas de jugadores y modales sin perder la identidad visual exacta del prototipo.