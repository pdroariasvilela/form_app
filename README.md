# **Cómo clonar y ejecutar el proyecto**

Este documento detalla cómo clonar, instalar y ejecutar el proyecto Flutter, incluidas instrucciones específicas para probarlo en dispositivos físicos como iOS y Android.

---

## **1. Clonar el proyecto**

1. Abre tu terminal y ejecuta el siguiente comando para clonar el repositorio:
   ```
   git clone git@github.com:pdroariasvilela/form_app.git
   cd flutter_application_form
   ```


2.	Instala las dependencias del proyecto:
   
   ```- flutter pub get```

2. Configurar el entorno

2.1 Verifica tu instalación de Flutter

Asegúrate de que Flutter esté correctamente instalado ejecutando: 
```
flutter doctor
```

Corrige cualquier problema indicado por flutter doctor. Asegúrate de que todos los requisitos para iOS y Android estén marcados como [✓].

2.2 Configurar un emulador o dispositivo físico
	•	Android:
	1.	Conecta tu dispositivo Android o inicia un emulador desde Android Studio.
	2.	Habilita la depuración USB en tu dispositivo Android.
	3.	Verifica que tu dispositivo esté conectado:

 - flutter devices

	•	iOS:
	1.	Conecta tu iPhone o abre un simulador desde Xcode.
	2.	Verifica que tu dispositivo esté conectado:

- flutter devices



3. Ejecutar el proyecto
   
3.1 En un dispositivo Android
	1.	Conecta tu dispositivo Android o inicia un emulador.
	2.	Ejecuta la aplicación:

  -  flutter run


3.2 En un dispositivo iOS
	1.	Abre el proyecto en Xcode:
      ``` - open ios/Runner.xcworkspace ```
	2.	Configura la firma del proyecto:
	•	Ve a Signing & Capabilities.
	•	Selecciona tu Team (cuenta de Apple).
	•	Asegúrate de que el Bundle Identifier sea único (por ejemplo, com.tuNombre.flutterApp).
	•	Marca la opción Automatically manage signing.
	3.	Corre la aplicación en tu iPhone desde Xcode:
	•	Selecciona tu dispositivo en la barra superior de Xcode.
	•	Ve a Product > Run o presiona Cmd + R.
	4.	También puedes ejecutar directamente desde Flutter:
 
   ```bash flutter run```

4. Solucionar “Desarrollador no confiable” en iOS

Si aparece el mensaje “Desarrollador no confiable” al intentar abrir la app en tu dispositivo iOS, sigue estos pasos:
	1.	Abre Configuración > General > VPN y administración de dispositivos en tu iPhone.
	2.	Toca el perfil del desarrollador (con tu Apple ID).
	3.	Toca Confiar en [Nombre del desarrollador].

5. Probar la app en la web (opcional)

Si deseas probar la app en un navegador:
	1.	Asegúrate de que Chrome esté instalado en tu máquina.
	2.	Ejecuta:

```flutter run -d chrome```

6. Estructura del proyecto

El proyecto está organizado de la siguiente manera:


lib/
├── models/                  # Validadores del formulario
├── screens/                 # Pantallas de la app
├── main.dart                # Punto de entrada principal


Notas adicionales
	•	Cuentas de Apple: Si usas una cuenta gratuita, las apps instaladas en dispositivos iOS expiran después de 7 días. Debes volver a firmarlas desde Xcode.
	•	Flutter doctor: Si encuentras problemas al ejecutar, verifica tu instalación con:
``` -flutter doctor ```


Con estos pasos, deberías poder clonar y ejecutar el proyecto en cualquier dispositivo. ¡Listo para usar!
