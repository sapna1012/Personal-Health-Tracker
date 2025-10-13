import { LightningElement, track } from 'lwc';
import getUsers from '@salesforce/apex/UserController.getUsers';
import getNutritionists from '@salesforce/apex/UserController.getNutritionists';

export default class UserManager extends LightningElement {
    @track users = [];
    @track nutritionists = [];

    connectedCallback() {
        this.loadUsers();
        this.loadNutritionists();
    }

    loadUsers() {
        getUsers()
            .then(result => { this.users = result; })
            .catch(error => { console.error('Error fetching users:', error); });
    }

    loadNutritionists() {
        getNutritionists()
            .then(result => { this.nutritionists = result; })
            .catch(error => { console.error('Error fetching nutritionists:', error); });
    }

    handleSuccess(event) {
        this.loadUsers();
        alert('User saved successfully!');
    }
}
