# API de Validación de Conexión con Plaid

## Descripción

Esta API de validación de conexión segura integra [Plaid](https://plaid.com/) para realizar pruebas y validaciones de conexiones bancarias. Plaid es una plataforma que permite conectar aplicaciones con cuentas bancarias de manera segura, facilitando el intercambio de información financiera.

![Plaid Logo](https://plaid.com/favicon.ico)

### Características

- **Integración con Plaid**: Conecta la API con [Plaid](https://plaid.com/), permitiendo validar conexiones entre aplicaciones y bancos de manera eficiente.
- **Conexión segura**: Utiliza **API Key** para garantizar conexiones seguras.
- **Pruebas de conexión**: La API realiza pruebas y valida las conexiones, proporcionando códigos de estado y detalles para asegurar el funcionamiento correcto.

## 🚀 Instrucciones de Uso

### 📋 Requisitos

1. **API Key de Plaid**: Necesitarás una clave de API de Plaid para realizar las validaciones. [Obtenla aquí](https://plaid.com/docs/).
2. **Herramienta de pruebas**: Se recomienda usar [Postman](https://www.postman.com/) para realizar las pruebas de conexión.

### 🔧 Cómo hacer pruebas de conexión

1. Regístrate en [Plaid](https://plaid.com/) y obtiene tu **API Key**.
2. Configura el entorno en [Postman](https://www.postman.com/).
3. Realiza peticiones a la API para validar la conexión con Plaid.
4. La API te devolverá códigos de estado y detalles sobre la conexión, como imágenes y otros datos importantes.

### 📝 Ejemplo de solicitud

```http
POST /v1/validate_connection
Host: api.tuservicio.com
Content-Type: application/json
Authorization: Bearer {API_KEY}

{
  "plaid_client_id": "{PLAID_CLIENT_ID}",
  "plaid_secret": "{PLAID_SECRET}",
  "account_number": "1234567890"
}
