export interface ProductDetails {
  id: number;
  name: string;
  description: string;
  image_path: string;
  model_path: string;
  user_id: string;
  created_at: string;
  updated_at: string;
  is_visible: boolean;
}

export interface UserUpload {
  id: string;
  image_path: string;
  created_at: string;
} 