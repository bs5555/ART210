class bsData
{
  String filename = "";
  JSONArray json;
  ArrayList<bsField> fields = new ArrayList<bsField>();
  
  bsData(String f)
  {
    filename = f;
  }
  
  public void read()
  {
    boolean file = false;
    try {
      json = loadJSONArray(filename);
      file = true;
    } catch(java.lang.RuntimeException e) {e.printStackTrace();}
    if(file)
    {      
      for(int f=0; f<fields.size(); f++)
      {
        bsField buf = fields.get(f);
        buf.init(json.size());
      } 
      for (int i = 0; i < json.size(); i++) 
      {   
        JSONObject record = json.getJSONObject(i);
        
          for(int f=0; f<fields.size(); f++)
          {
            bsField buf = fields.get(f); 
            String nn = buf.name;
            String tt = buf.type;
            float min = buf.minV;
            float max = buf.maxV;
            switch(tt)
            {
              case "int" : 
                int ires=record.getInt(nn);
                if(min > ires) buf.minV=ires;
                if(max < ires) buf.maxV=ires;
                buf.fPut(ires);
              break;
              case "float" : 
                float fres=record.getFloat(nn);
                if(min > fres) buf.minV=fres;
                if(max < fres) buf.maxV=fres;
                buf.fPut(fres);
              break;
              case "string" : 
                String sres=record.getString(nn); 
                buf.sPut(sres);
              break;
            }
          }
      }
    }
  }
  
  public void normalize(float minN, float maxN)
  {
    for(int i=0; i < fields.size(); i++)
    {
      bsField buf = fields.get(i);
      if(buf.type!="string")
      {
        for(int j=0; j<json.size(); j++)
        {
          buf.fStor[j]=map(buf.fStor[j],buf.minV,buf.maxV,minN,maxN);
        }
      }
      
    }
  }
  
  
  public bsData addField(String n, String t)
  {
    fields.add(new bsField(n,t));
    return(this);
  }
  
  public int size()
  {
    return(json.size());
  }
  
  public String get(int i,String name)
  {
    for(int j=0; j<fields.size(); j++)
    {
      bsField buf=fields.get(j);
      if(buf.name==name)
      {
        switch(buf.type)
        {
          case "int" : return(str(buf.fStor[i])); 
          case "float" : return(str(buf.fStor[i])); 
          case "string" : return(buf.sStor[i]);
        }
      }
    }
    return("");
  }
  
}  


class bsField
{
  String name = "";
  String type = "";
  float minV = 1000000000000.0;
  float maxV = -1000000000000.0;
  float[] fStor;
  String[] sStor;
  int fC = 0;
  int sC = 0;
  
  bsField(String n, String t)
  {
    name=n;
    switch(t)
    {
      case "int" : type="int"; break;
      case "float" : type="float"; break;
      case "string" : type="string"; break;
    }
  }
  
  void init(int n)
  {
    if(type=="string") 
    {
      sStor=new String[n];
    }
    else
    {
      fStor=new float[n];
    }
    
  }
  
  void fPut(float v)
  {
    fStor[fC]=v;
    fC++;
  }
  
  void sPut(String v)
  {
    sStor[sC]=v;
    sC++;
  }
}
