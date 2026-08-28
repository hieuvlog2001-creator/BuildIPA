const form=document.getElementById("loginForm");
form.addEventListener("submit",e=>{e.preventDefault();const a=document.getElementById("account").value.trim(),p=document.getElementById("password").value;const db=loadDB();
if(a==="admin"&&p==="admin123"){sessionStorage.setItem("bank_admin","1");location.href="admin.html";return}
const u=db.users.find(x=>x.id===a&&x.password===p);const msg=document.getElementById("loginMsg");
if(!u){msg.textContent="Số tài khoản hoặc mật khẩu không đúng.";return}
if(u.status!=="active"){msg.textContent="Tài khoản đang bị khóa.";return}
sessionStorage.setItem("bank_user",u.id);location.href="banking.html"});