Paso 1: Crear Proyecto Flutter

Se creó un nuevo proyecto Flutter con el comando:
flutter create nombre_del_proyecto
Luego se agregó la navegación con GoRouter.

Paso 2: Configurar GoRouter

Se añadió la dependencia en pubspec.yaml:
  go_router: ^13.0.1
Se configuraron las rutas en un archivo main.dart y router.dart con navegación entre Home y pantallas de calculadoras.

Paso 3: Crear Pantallas para Calculadoras

Se crearon dos pantallas principales:
1. Calculadora de Edad: permite ingresar la fecha de nacimiento y calcula la edad actual.
2. Calculadora de Calorías: solicita peso, altura, edad y género, y calcula el metabolismo basal (BMR).

Paso 4: Ajustes de UI y Funcionalidad

Se centraron los elementos visuales con Column y padding.
Se agregaron validaciones en los formularios.

Paso 5: Corrección de errores de navegación

Se resolvió el error 'GoError: There is nothing to pop' usando esta lógica:
if (context.canPop()) context.pop(); else context.go('/');
Esto garantiza una navegación segura con botón de retroceso en AppBar.

Paso 6: Confirmar funcionamiento

Se verificó que la navegación entre pantallas funciona correctamente.
Todos los cálculos se muestran y los botones están bien alineados.


¡Listo! La app ahora está funcional y preparada para incluir más calculadoras si se desea.

