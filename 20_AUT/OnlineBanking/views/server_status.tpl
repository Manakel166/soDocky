%if name == 'Unknown':
    <h1>Hello Unknown User!</h1>
    <div class="server_status">
        UNKNOWN
    </div> <!-- class="server_status" -->

    <p>Please state your name to get the server status !</p>
%else:
    <h1>Hello {{name.title()}}!</h1>
    <div class="server_status">
        RUNNING
    </div> <!-- class="server_status" -->
%end
