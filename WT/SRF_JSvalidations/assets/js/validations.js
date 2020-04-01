function ValidateForm(form) {
  var mailformat = /^[0-9]{2}[A-Za-z]{3}[0-9]{3}@nirmauni.ac.in$/;
  var phoneno = /^\d{10}$/;
  var letters = /^[A-Za-z ]+$/;
  var pcode = /^[0-9]{6}$/
  var pass = /^.*(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!#$%&?@ "]).*$/

  // var a = form.BCA
  // var b = form.BCom
  // var c = form.BSc
  // var d = form.BA
  // var e = form.BTech
  // var f = form.BArch
  // var g = form.MA
  // var h = form.MSc
  // var i = form.MTech
  // var j = form.MCom

  if(!( form.Firstname.value.match(letters)) || !( form.Lastname.value.match(letters))){
    alert('Name must have alphabet characters only');
    form.Firstname.focus();
    form.Lastname.focus();
    return false;
  }
  else if(!(form.Email.value.match(mailformat)))
  {
    alert("You have entered an invalid email address!");
    form.Email.focus();
    return false;
  }
  else if(!(form.Contact.value.match(phoneno))){
    alert("You have entered an invalid contact!");
    form.Contact.focus();
    return false;
  }
  else if(!(validGender(form.Male, form.Female, form.Other))){
    alert("Please check Gender field!");
    form.Male.focus();
    return false;
  }
  else if(!(form.Pincode.value.match(pcode))){

    alert("Invalid Pincode!");
    form.Pincode.focus();
    return false;
  }
  else if (form.pass1.value != form.pass2.value ) {
    alert("Passwords do not match!")
    form.pass1.focus();
    return false;
  }
  else if ( !(form.pass1.value.match(pass))){
    alert("Password must be minimum of eight characters long consisting of a combination of uppercase letter, lowercase letter, and digits.!")
    form.pass1.focus();
    return false;
  }
  else {
    return true;
  }
  // else if(!(validCourse(a,b,c,d,e,f,g,h,i,j))){
  //   alert("Please Select Course Field Properly! Only One allowed..");
  //   a.focus();
  //   return false;
  // }
}

function validGender(umale,ufemale,uother)
{
  x=0;

  if(umale.checked)
  {
  x++;
  }

  if(ufemale.checked)
  {
  x++;
  }

  if(uother.checked)
  {
  x++;
  }

  if (x>=2)
  {
  umale.checked=false;
  ufemale.checked=false;
  uother.checked=false;
  umale.focus();
  return false;
  }
  else if (x == 0) {
    umale.checked=false;
    ufemale.checked=false;
    uother.checked=false;
    umale.focus();
    return false;
  }
  else{
    return true;
  }
}

function validCourse(bca,bcom,bsc,ba,btech,barch,ma,msc,mtech,mcom)
{
  x=0;

  if(bca.checked)
  {
  x++;
  }

  if(bcom.checked)
  {
  x++;
  }

  if(bsc.checked)
  {
  x++;
  }

  if(ba.checked)
  {
  x++;
  }

  if(btech.checked)
  {
  x++;
  }

  if(barch.checked)
  {
  x++;
  }

  if(ma.checked)
  {
  x++;
  }

  if(msc.checked)
  {
  x++;
  }

  if(mtech.checked)
  {
  x++;
  }

  if(mcom.checked)
  {
  x++;
  }

  if (x>=2)
  {
  bca.checked=false;
  bcom.checked=false;
  bsc.checked=false;
  ba.checked=false;
  btech.checked=false;
  barch.checked=false;
  ma.checked=false;
  msc.checked=false;
  mtech.checked=false;
  mcom.checked=false;
  bca.focus();
  return false;
  }
  else if (x == 0) {
    bca.checked=false;
    bcom.checked=false;
    bsc.checked=false;
    ba.checked=false;
    btech.checked=false;
    barch.checked=false;
    ma.checked=false;
    msc.checked=false;
    mtech.checked=false;
    mcom.checked=false;
    bca.focus();
    return false;
  }
  else{
    return true;
  }
}
