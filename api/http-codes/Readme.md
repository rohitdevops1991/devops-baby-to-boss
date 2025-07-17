# HTTP Status Codes Explained

As of my knowledge cutoff in October 2023, there are **63 officially registered HTTP status codes** maintained by IANA (Internet Assigned Numbers Authority). These are divided into five classes:

### Breakdown by Class:
1. **Informational (1xx)**: 4 status codes  
   (100, 101, 102, 103)

2. **Success (2xx)**: 10 status codes  
   (200, 201, 202, 203, 204, 205, 206, 207, 208, 226)

3. **Redirection (3xx)**: 9 status codes  
   (300, 301, 302, 303, 304, 305, 306, 307, 308)

4. **Client Error (4xx)**: 27 status codes  
   (400, 401, 402, 403, 404, 405, 406, 407, 408, 409,  
   410, 411, 412, 413, 414, 415, 416, 417, 418, 421,  
   422, 423, 424, 425, 426, 428, 429, 431, 451)

5. **Server Error (5xx)**: 13 status codes  
   (500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511)

### Notes:
- Some codes are **obsolete** (e.g., 306 "Unused").
- **Non-standard codes** exist (e.g., 420 "Enhance Your Calm" by Twitter, 499 "Client Closed Request" by Nginx).
- New codes may be added over time (e.g., 103 Early Hints was added in 2017).
- Web servers/frameworks sometimes use custom codes (like 418 "I'm a teapot" as an April Fools' joke in RFC 2324).

For the most current list, check the [IANA HTTP Status Code Registry](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml).


This document explains all major HTTP status codes in a clear way with examples for each category.

## Table of Contents
1. [Informational Responses (100-199)](#informational-responses-100-199)
2. [Successful Responses (200-299)](#successful-responses-200-299)
3. [Redirection Messages (300-399)](#redirection-messages-300-399)
4. [Client Error Responses (400-499)](#client-error-responses-400-499)
5. [Server Error Responses (500-599)](#server-error-responses-500-599)

---

## Informational Responses (100-199)
Temporary responses that indicate the client should continue with the request.

### 100 Continue
- **Meaning**: The server has received the request headers and the client should proceed to send the request body.
- **Example**: When uploading a large file, the client first checks if the server will accept it.

### 101 Switching Protocols
- **Meaning**: The server is switching protocols as requested by the client.
- **Example**: Switching from HTTP to WebSocket during a connection upgrade.

### 102 Processing (WebDAV)
- **Meaning**: The server has received and is processing the request, but no response is available yet.
- **Example**: Used in long-running WebDAV requests.

### 103 Early Hints
- **Meaning**: Used to return some response headers before the final HTTP message.
- **Example**: Server sends hints about resources that will likely be needed.

---

## Successful Responses (200-299)
Indicates that the client's request was successfully received, understood, and accepted.

### 200 OK
- **Meaning**: Standard response for successful HTTP requests.
- **Example**: Successful GET request returning requested data.

### 201 Created
- **Meaning**: The request has been fulfilled and resulted in a new resource being created.
- **Example**: Successful POST request that creates a new user account.

### 202 Accepted
- **Meaning**: The request has been accepted for processing, but processing isn't complete.
- **Example**: Request to generate a report that will take time to complete.

### 204 No Content
- **Meaning**: The server successfully processed the request but isn't returning any content.
- **Example**: Successful DELETE request where nothing needs to be returned.

### 205 Reset Content
- **Meaning**: Tells the client to reset the document view.
- **Example**: After submitting a form, the browser should clear the form fields.

### 206 Partial Content
- **Meaning**: The server is delivering only part of the resource due to a range header.
- **Example**: Resuming a paused download or streaming media.

---

## Redirection Messages (300-399)
Indicates that further action needs to be taken by the user agent to fulfill the request.

### 301 Moved Permanently
- **Meaning**: The requested resource has been permanently moved to a new URL.
- **Example**: Company changes domain from `example.com` to `newexample.com`.

### 302 Found (Previously "Moved Temporarily")
- **Meaning**: The requested resource resides temporarily under a different URL.
- **Example**: Temporary redirect during site maintenance.

### 303 See Other
- **Meaning**: The response can be found under a different URL using a GET method.
- **Example**: Redirect after form submission to prevent duplicate submissions.

### 304 Not Modified
- **Meaning**: Indicates the resource hasn't been modified since last request.
- **Example**: Browser cache is still valid (used with ETags/Last-Modified headers).

### 307 Temporary Redirect
- **Meaning**: Similar to 302 but guarantees the method won't change.
- **Example**: Temporary URL change while maintaining HTTP method.

### 308 Permanent Redirect
- **Meaning**: Similar to 301 but guarantees the method won't change.
- **Example**: Permanent URL change while maintaining HTTP method.

---

## Client Error Responses (400-499)
Indicates errors that seem to have been caused by the client.

### 400 Bad Request
- **Meaning**: The server cannot process the request due to client error.
- **Example**: Malformed request syntax or invalid request message framing.

### 401 Unauthorized
- **Meaning**: Authentication is required and has failed or not been provided.
- **Example**: Trying to access a protected resource without valid credentials.

### 403 Forbidden
- **Meaning**: The server understood the request but refuses to authorize it.
- **Example**: User tries to access admin pages without admin privileges.

### 404 Not Found
- **Meaning**: The requested resource could not be found.
- **Example**: Visiting a URL that doesn't exist on the server.

### 405 Method Not Allowed
- **Meaning**: The request method is not supported for the requested resource.
- **Example**: Sending a POST request to a read-only endpoint.

### 408 Request Timeout
- **Meaning**: The server timed out waiting for the request.
- **Example**: Client takes too long to send the complete request.

### 409 Conflict
- **Meaning**: Request conflicts with current state of the server.
- **Example**: Trying to update a resource that has been modified by another request.

### 410 Gone
- **Meaning**: The resource is no longer available and won't be available again.
- **Example**: A limited-time offer page that has expired.

### 429 Too Many Requests
- **Meaning**: The user has sent too many requests in a given time.
- **Example**: API rate limiting response.

---

## Server Error Responses (500-599)
Indicates cases where the server is aware that it has encountered an error.

### 500 Internal Server Error
- **Meaning**: Generic error message when server encounters an unexpected condition.
- **Example**: Unhandled exception in server-side code.

### 501 Not Implemented
- **Meaning**: The server does not support the functionality required to fulfill the request.
- **Example**: Requesting an unimplemented HTTP method.

### 502 Bad Gateway
- **Meaning**: Server acting as gateway received an invalid response.
- **Example**: Reverse proxy server can't get a valid response from backend servers.

### 503 Service Unavailable
- **Meaning**: The server is currently unavailable (overloaded or down for maintenance).
- **Example**: Website temporarily down for scheduled maintenance.

### 504 Gateway Timeout
- **Meaning**: Server acting as gateway didn't receive timely response.
- **Example**: Backend server takes too long to respond to reverse proxy.

### 505 HTTP Version Not Supported
- **Meaning**: The server doesn't support the HTTP protocol version used in the request.
- **Example**: Client sends request using HTTP/3 but server only supports up to HTTP/2.

---

## Additional Notes
- Status codes are three-digit numbers where the first digit defines the class of response
- Official list is maintained by IANA: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
- Some web servers and frameworks may use custom status codes beyond the standard ones

For more detailed information, refer to [RFC 7231](https://tools.ietf.org/html/rfc7231) and related HTTP specifications.
