- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/people" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/people" People
- active = context.request.path == "/children" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/children" Children

