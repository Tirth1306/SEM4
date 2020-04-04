#!/usr/bin/env python
# coding: utf-8

# In[16]:


t= int(input())
t1=t
cs=1
ans=list()
while(t>0):
    t=t-1
    n,k=[int(x) for x in input().split(" ")]
    a=k//n
    matrix=[]
    fg=1
    if(a*n==k):
        tr=[a]
        tr=tr*n
        lst=list(range(1,n+1))
        i=lst.index(a)
        b=lst[0]
        lst[0]=a
        lst[i]=b
        fg=0
        for i in range(n):
            matrix.append(lst.copy())
            lst.insert(0,lst.pop())
    else:
        pad=k-a*n
        tr=[a]
        tr=tr*n
        if(pad<=(n/2)):
            ex=pad
            for i in range(0,n//2):
                tr[i]+=1
                if(pad!=0):
                    pad-=1
                else:
                    tr[n-i-1]-=1
        else:
            w=pad%(n//2)
            for j in range(0,w):
                tr[j]+=2
                pad-=2
            for i in range(w,n//2):
                tr[i]+=1
                if(pad==0):
                    tr[n-i-1]-=1
                else:
                    pad-=1
        
        if(0 in tr):
            ans.append([cs,"IMPOSSIBLE"])
            #print("Case #{}: IMPOSSIBLE".format(cs))
            cs=cs+1
            continue
        else:
            lst=list(range(1,n+1))
            i=lst.index(tr[0])
            b=lst[0]
            lst[0]=tr[0]
            lst[i]=b
            col=[[0] for i in range(n)] 
            matrix.append(lst)
            lt=list()
            for i in range(n):
                col[i].append(matrix[0][i])
            for i in range(1,n):
                for j in range(n):
                    fg=1
                    if(i==j):
                        lt.append(tr[i])
                        col[j].append(tr[i])
                        continue
                    for k in range(1,n+1):
                        if(k not in col[j] and k!=tr[i]):
                            fg=0
                            lt.append(k)
                            col[j].append(k)
                            break
                    if(fg==1):
                        break
                if(fg==1):
                    break
                
    if(fg==1):
        ans.append([cs,"IMPOSSIBLE",n])
        #print("Case #{}: IMPOSSIBLE".format(cs))
        cs=cs+1
        continue
    else:
        ans.append([cs,"POSSIBLE",matrix,n])
        #print("Case #{}: POSSIBLE".format(cs))
        cs=cs+1
        
        

for i in range(0,t1):
    if(ans[i][1]=="POSSIBLE"):
        print("Case #{}: POSSIBLE".format(ans[i][0]))
        matrix=ans[i][2]
        n=ans[i][3]
        for a in range(n):
            for b in range(n):
                print(matrix[a][b],end=" ")
            print()
    else:
        print("Case #{}: IMPOSSIBLE".format(ans[i][0]))


# In[ ]:




