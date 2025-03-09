# FinBank-Digital

## III. Infraestructura de TI
### III.1. Escaneo de vulnerabilidades en servidores (Nessus)
- Se utilizarán herramientas como **Nessus** para identificar vulnerabilidades en servidores críticos.
- Se generarán reportes detallados de vulnerabilidades encontradas y posibles mitigaciones.

  ![image](https://github.com/user-attachments/assets/0cf54a00-3f77-4239-a6cb-a555cbd41ca0)


### III.2. Análisis de tráfico de red (Wireshark)
- Captura y análisis de paquetes de red para detectar posibles amenazas o anomalías.
- Identificación de patrones de tráfico sospechoso y posibles intentos de intrusión.
  
![image](https://github.com/user-attachments/assets/4584435a-0b17-4c8b-be22-3a3c599b993a)

### III.3. Seguridad perimetral en Azure (Simulado de nube con GNS3)
- Revisión de configuración y acceso en la infraestructura de **Azure**.
- Implementación de buenas prácticas en la gestión de firewall y reglas de acceso.

![image](https://github.com/user-attachments/assets/48a2f463-f3bc-4fad-9691-449cffadf86a)

---

## IV. Aplicaciones y Bases de Datos

### IV.1. Pruebas de seguridad en APIs (Postman)
#### Configuración y Verificación de Herramienta:

- **Postman:**
  - Confirmar que la aplicación carga correctamente sin errores en la interfaz.
  - Asegurar que la aplicación esté correctamente iniciada.
  - Verificar que el **proxy** está activo en la interfaz `127.0.0.1` y el puerto `8080`.
  - Iniciar el modo de **intercepción de tráfico**.

    ![image](https://github.com/user-attachments/assets/8ad44a07-cd6d-44ad-a3fa-ef2caccccb23)


#### Pruebas con API de Seguridad:
- Se utilizará la API vulnerable de prueba desde GitHub:
  - [DVWS-Node](https://github.com/snoopysecurity/dvws-node)
- Se realizarán pruebas de seguridad enfocadas en entornos financieros.

  ![image](https://github.com/user-attachments/assets/e67b8ee4-3434-4f35-b8c9-02e2a39cb608)


### IV.1.0. Inyección SQL en SQL Server y MongoDB (SQLMap/Postman SQLScan)
- Uso de **SQLMap** y **Postman SQLScan** para detectar vulnerabilidades de inyección SQL.
- Pruebas dirigidas a bases de datos **SQL Server** y **MongoDB**.

![image](https://github.com/user-attachments/assets/c78e8d21-3440-4318-bb30-d148cee785f1)


### IV.1.2. Evaluación del procesamiento de pagos en tiempo real
- Pruebas en sistemas transaccionales para detectar fraudes.
- Simulación de pagos en entornos de prueba.

![image](https://github.com/user-attachments/assets/6b16dd02-9c4c-4edd-9b30-fb179187ef05)

---

## IV.2. Seguridad y Cumplimiento

### IV.2.0. Revisión de cumplimiento PCI DSS (iAuditor)
- Validación de estándares **PCI DSS** en sistemas y aplicaciones.

### IV.2.1. Análisis de gestión de claves criptográficas (Sambix)
- Evaluación de almacenamiento y manejo de claves de cifrado.

### IV.2.2. Validación de monitoreo y gestión de incidentes (Sambix/iAuditor )
- Revisión de herramientas de **SIEM** para la detección y respuesta ante incidentes.

### IV.2.3. Evaluación de normativas bancarias y reportería financiera
- Validación del cumplimiento regulatorio con **iAuditor **.
![image](https://images.app.goo.gl/DrfTQMBhNq3fkLia6)
### IV.2.4. Auditoría de políticas anti-lavado de dinero
- Revisión de controles y detección de transacciones sospechosas.

---

## IV.3. Disponibilidad y Resiliencia de la Infraestructura

### IV.3.0. Evaluación de SLAs y escalabilidad de la plataforma
- Pruebas de carga y disponibilidad

### IV.3.1. Pruebas de respuesta ante incidentes
- Simulación de ataques y validación de tiempos de respuesta.

### IV.3.2. Monitoreo de transacciones y detección de fraudes
- Análisis de logs y eventos de seguridad.

---

📌 **Este repositorio se actualizará con nuevas pruebas y mejoras en la auditoría de seguridad de FinBank Digital.**
