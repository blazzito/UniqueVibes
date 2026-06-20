# UniqueVibes UI Design Guide

Esta guía de diseño establece los estilos base, paletas de colores y reglas generales para todos los rediseños y nuevas interfaces de usuario en el servidor. 

> **Nota:** Usar este archivo como referencia principal antes de empezar a rediseñar cualquier script.

## Tipografía
- **Fuente Principal:** `Outfit`, sans-serif (Debe incluirse mediante Google Fonts).
- **Fuentes Secundarias/Acentos:** `Quicksand`, sans-serif y `Bebas Neue`, sans-serif (usadas en indicadores específicos como velocidades o títulos del HUD).

## Paleta de Colores
- **Color de Acento Primario (Naranja):** `#ff6b00` (Usado para elementos activos, selecciones, botones principales, barra de vida/estrés).
- **Color de Acento Secundario (Azul Petróleo):** `#00a8cc` (Usado para escudos/armadura, luces altas, o acentos complementarios).
- **Fondo Oscuro Base:** `#0f0f0f`
- **Fondo "Glass" (Paneles):** `rgba(12, 12, 14, 0.95)`
- **Bordes "Glass":** `rgba(255, 255, 255, 0.08)`
- **Sombra para Efectos de Resplandor (Glow):** `drop-shadow(0 0 0.4vh rgba(255, 107, 0, 0.4))` (ajustado según el color).

## Estilos y Componentes (Glassmorphism)
- Los contenedores principales deben utilizar fondos semi-transparentes oscuros con bordes muy finos y claros.
- **EXCEPCIÓN CRÍTICA sobre `backdrop-filter: blur()`:** El motor de renderizado de FiveM (CEF antiguo) **NO** renderiza correctamente la propiedad `backdrop-filter: blur(...)`. Produce fallos gráficos, bordes cortados o simplemente no se muestra. **SE DEBE EVITAR SU USO ABSOLUTAMENTE.** La sensación de cristal debe lograrse únicamente con la opacidad del fondo (ej. `rgba(12, 12, 14, 0.95)`) y las sombras (box-shadow).
- **Sombras:** Usar `box-shadow: 0 0.5vh 2vh rgba(0, 0, 0, 0.5)` para dar profundidad a los paneles.

## Elementos Interactivos (Botones / Filtros)
- **Estado Normal:** Fondo tenue `rgba(255, 255, 255, 0.05)`, borde `1px solid rgba(255, 255, 255, 0.08)` o simplemente sin borde y fondo oscurecido.
- **Estado Hover/Activo:** Fondo ligeramente más opaco del color principal (ej. `rgba(255, 107, 0, 0.15)`), borde del color principal (`rgba(255, 107, 0, 0.4)`) y cambio de color del texto/icono. 
- **Animaciones Micro-interactivas:** Pequeñas transiciones como `transform: translateY(-0.2vh)` o `scale(1.02)` al hacer hover o active, para hacer la UI más viva.
