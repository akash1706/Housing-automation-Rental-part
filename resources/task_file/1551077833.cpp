#include<iostream>
#include<cstdlib>

using namespace std;

struct node
{
    int data;
    struct node *next;
    struct node *prev;

}*fptr,*tptr,*nptr;

int main()
{
    int item,i;
    fptr=new(node);
    cout<<"INPUT DATA FOR THE NODES"<<endl;
    cin>>item;
    fptr->data=item;
    fptr->prev=NULL;
    fptr->next=NULL;
    tptr=fptr;
    for(i=2;i<=7;i++)
    {
        nptr=new(node);
        cin>>item;
        nptr->data=item;
        nptr->next=NULL;
        nptr->prev=tptr;
        tptr->next=nptr;
        tptr=nptr;
    }



    tptr=fptr;
    cout<<"DATA IN THE DOUBLE LINKED LIST"<<endl;
        while(tptr!=0)
        {
            cout<<tptr->data<<endl;
            tptr=tptr->next;
        }

    tptr=nptr;
    cout<<"DATA IN REVERSE SEQUENCE"<<endl;

        while(tptr!=0)
        {
            cout<<tptr->data<<endl;
            tptr=tptr->prev;
        }
}
