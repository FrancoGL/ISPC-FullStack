export interface User {
  username : string;
  first_name: string;
  last_name: string;
  email: string;
  password: string;
  phone?: string;
  role?: string[];
  photo?: string;
  address?: any;
}
