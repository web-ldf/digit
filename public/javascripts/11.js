<script>
     $(function(){
         $.ajax({
             url:"http://localhost:5050/index",
             type:"get",
             success:function(result){
               var newProduct=result;
               console.log(newProduct);
               var HTML=``;
               for(var p of newProduct){
                 HTML+=`
                 <div class="col-lg-3 col-md-6 mt-md-2 mt-sm-2">
                    <div class="card">
                        <a href="${p.href}"><img src="../public/images/HC-MDH2GKK-K.jpg" class="w-100" alt=""/></a>
                        <div class="card-body py-0">
                            <span>销量：</span><span>${p.stock}</span>
                            <h5 class="d-inline-block float-right">¥${p.price.toFixed(2)}</h5>
                        </div>
                        <p class="text-small text-center">${p.details}</p>
                    </div>
                 </div>
                 `;
               }
               //添加到新产品div中
               $("#newProducts").html(HTML);
             }
         })
     })
 </script>