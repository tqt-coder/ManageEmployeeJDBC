<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee</title>
</head>
<style>
    *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;

}
html{
    font-size: 62.5%;
    line-height: 1.6rem;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}
body{
    font-family: inherit;
}
.app{
    width: 60rem;
    background-image: linear-gradient(90deg,#0eea3b,#2bc34a);
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 0 auto;
    padding: 2rem 1rem;
}
.form-register{
    width: 100%;
}
.form-register__title{
    font-size: 2rem;
    text-transform: uppercase;
    letter-spacing: 0.2rem;
    text-align: center;
    margin: 2rem 0;
}
.from-register__infor{
    display: flex;
    padding: 1rem 1rem 1rem 4rem;
    justify-content: space-between;
    align-items: center;
    width: 100%;
}
.from-register__detail{
    padding: 0.4rem 0.8rem;
    font-size: 1.6rem;
    margin-left: auto;
    outline: none;
    width: 30rem;
    border-radius: 0.4rem;
    border-color: transparent;
}
.validate .from-register__detail{
    border-color: #ff0201;
    
}
.validate .text-error{
    display: block;
}
.form-register__content{
    font-size: 1.6rem;
}
.form-register__content-symbol{
    color: #ff0201;
}
.form-register__btn{
    display: block;
    margin: 2rem 0 0 4rem;
    width: 20rem;
    height: 4rem;
    background-color: #0084ff;
    color: #fff;
    font-size: 1.8rem;
    border-color: transparent;
    text-transform: uppercase;
    letter-spacing: 0.2rem;
    font-weight: 600;
}
.user-list{
    font-size: 1.6rem;
    text-transform: uppercase;
    letter-spacing: 0.1rem ;
    margin: 3rem 0;
}
.text-error{
    font-size: 1.4rem;
    color: #ff0201;
    margin-top: 0.4rem;
    display: none;
}
.user-container{
    width: 100%;
    max-height: 30vh;
    overflow-y: auto;
}
.user-container::-webkit-scrollbar{
    display: none;
}
.user-infor, td, th {  
    border: 1px solid #555;
    text-align: left;
  }

 tr:first-child{
    background-color: #d0011b;
    color: #fff;
    font-size: 1.4rem;
  }
  tr{
    background-color: #ccc;
    font-size: 1.2rem;
  }
.user-infor {
    border-collapse: collapse;
    width: 100%;
  }
  
  th, td {
    padding: 10px;
  }



</style>
<body>
 <sql:query dataSource="${mysql }" var="rs">
 	Select * from employee where id=?;
 	<sql:param value="${param.id}" />
 </sql:query>
  <c:forEach var="row" items="${rs.rows}" >


    <div class="app">
        <h2>Thông tin nhân viên</h2>
        <form action='update.jsp?id=<c:out value="${param.id}"/>' method="Post" class="employee">
            <div class="from-register__infor ">
                <p class="form-register__content ">Full name
                  <span class="form-register__content-symbol">*</span>
                </p>
                <div class="form-register__containter">
                    <input type="text" rule="isRequired" placeholder="Enter first name" name="name"
                    value='<c:out value="${row.name }"></c:out>'      class="from-register__detail">
                    <span class="text-error"></span>
                </div>
            </div>
            <div class="from-register__infor ">
                <p class="form-register__content ">Email
                    <span class="form-register__content-symbol">*</span>
                </p>
                <div class="form-register__containter">
                    <input type="text" rule="isRequired|isEmail" placeholder="Enter first name" name="email"
                     value='<c:out value="${row.email }"></c:out>'    class="from-register__detail">
                    <span class="text-error"></span>
                </div>
            </div>

            <div class="from-register__infor ">
                <p class="form-register__content ">Country
                    <span class="form-register__content-symbol">*</span>
                </p>
                <div class="form-register__containter">
                    <input type="text" rule="isRequired" placeholder="Enter first name" name="country"
                 value='<c:out value="${row.country }"></c:out>'        class="from-register__detail">
                    <span class="text-error"></span>
                </div>
            </div>
            <input type="submit" value="Register" class="form-register__btn">
        </form>
    </div>
    </c:forEach>
<script>
const container = '.form-register__containter';
const showError = '.text-error';
let index =1;
const arrInfor = [];
let htmls = `<tr>
    <th>No</th>
    <th>First name</th>
    <th>Last name</th>
    <th>Email</th>
    <th>Username</th>
</tr>`
arrInfor.push(htmls);
const formRegister = () => {
    const form1 = document.querySelector('.employee');
    const inputs = form1.querySelectorAll('input[name]:not(:disabled)');
    const submit = form1.querySelector('.form-register__btn');
    const userInfor = document.querySelector('.user-infor');

    // Use generate object with key is input's name and value is an array rules
    const obRule = Array.from(inputs).reduce((input, value) => {
        let rules = value.getAttribute('rule').split('|');
        Array.from(rules).forEach((rule) => {
            // let rulePass = rule.split(':');
            // console.log(rulePass)
            
            if (Array.isArray(input[value.name])) {
                input[value.name].push(rule);
            }
            else {
                input[value.name] = [rule];
            }
        });
        return input;
    }, {});

    // generate object check rules
    const handlerError = {
        isRequired: function (value) {
            return value.trim() ? undefined : 'Vui lòng nhập thông tin';
        },
        isEmail: (value) => {
            const result = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value);
            return result ? undefined : 'Vui lòng nhập đúng định dạng email';
        },
        isPassword: (value) => {
            const pass = form1.querySelector('input[name="pass"]:not(disabled)').value;
            return pass === value ? undefined : 'Vui lòng nhập đúng mật khẩu xác nhận';
        },
        isMin: (value) => {
            return (minlength)=> {
                return value.length === minlength ? undefined : `Vui lòng nhập đủ ${minlength} kí tự`; 
            }
        }
        

    };

    (function handlerCode() {
        [...inputs].forEach((input, index) => {

            input.onblur = function(e){
                const tagInput = e.target;
                handlerBlur(tagInput);
            };
            // handler when user input
            input.oninput = handlerInput;
        });
    })()

    function findParent(input, parent) {
        do {
            if (input.parentElement.matches(parent)) {
                return input.parentElement;
            }
            else {
                input = input.parentElement;
            }
        }
        while (input.parentElement);


    }


    function handlerInput(e) {
        let input = e.target;
        const parentInput = findParent(input, container);
        parentInput.classList.remove('validate');
        parentInput.querySelector(showError).innerText = '';
    }

    function handlerBlur(input) {
        for (let i = 0; i < obRule[input.name].length; i++) {
            // obRule[input.name][i] is value of ObRule[key]
            let rule = obRule[input.name][i];
            let textError = handlerError[rule](input.value);
            const parentInput = findParent(input, container);
            if (textError) {
                if (parentInput) {
                    parentInput.classList.add('validate');
                    parentInput.querySelector(showError).innerText = textError;
                    return textError;
                }
            }
            else {
                parentInput.classList.remove('validate');
                parentInput.querySelector(showError).innerText = '';
            }
        }
    }

   
 
   
    
    // handler submit
    submit.onclick = (e) => {
       
        let flag = true;
        const information = {};
        [...inputs].forEach((input, index) => {
            flag = !handlerBlur(input);
            information[input.name] = input.value;
        });
        if(flag){
            
           // thỏa hết tất cả
            let rowInfor = `<tr>
            <th>${index}</th>
            <th>${information['fname']}</th>
            <th>${information['lname']}</th>
            <th>${information['email']}</th>
            <th>${information['userName']}</th>
                            </tr>
            
            `
            arrInfor.push(rowInfor);
            index ++;
            let html = arrInfor.join('\n');
            userInfor.innerHTML =  html;
            [...inputs].forEach((input, index) => {
                input.value = "";
            });
        }
        else{
            e.preventDefault();
        }
    };

};

formRegister();


</script>
</body>
</html>