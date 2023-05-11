const express=require("express");

const app=express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));
const productData=[];
app.listen(2000, () =>{
    console.log("Connected to server at 2000");
})

app.post("/api/add_product",(req,res)=>{
    console.log("Result",req.body);
    const pData={
        "id":productData.length+1,
        "pname": req.body.pname,
        "pprice":req.body.pprice,
        "pdesc": req.body.pdesc
    };
    productData.push(pData);
    console.log("Final",pData);

    res.status(200).send(
        {
            "status_code":200,
            "message":"product added successfully",
            "product":pData
        }
    )
}),
app.get("/api/get_product",(req,res)=>{
    if(productData.length>0){
        res.status(200).send(
            {
                "status_code":200,
                "products":productData
            }
        )
    }
    else{
        res.status(200).send(
            {
                "status_code":200,
                "products":[]
            }
        )
    }
})
app.put("/api/update_product/:id",(req,res) =>{
    let id=req.params.id*1;
    let productToUpdate=productData.find(p=>p.id===id);
    let index=productData.indexOf(productToUpdate);
    productData[index]=req.body;
    res.status(200).send(
        {
            'status_code':"success",
            'message':"product updated"
        }
    )

})

app.post("/api/delete_product/id", async(req,res)=>{
    let id=req.params.id *1;
    let productToUpdate=productData.find(p=>p.id===id);
    let index=productData.indexOf(productToUpdate);
    productData.splice(index,1);
    res.status(204).send({
        "status":"success",
        "message":"product deleted"
    })
})
