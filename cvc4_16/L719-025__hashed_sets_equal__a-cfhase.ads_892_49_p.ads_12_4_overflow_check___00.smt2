(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv x ((_ int2bv 32) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort hash_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 32))

(declare-fun user_eq (hash_type hash_type) Bool)

(declare-const dummy hash_type)

(declare-datatypes ((hash_type__ref 0))
(((hash_type__refqtmk (hash_type__content hash_type)))))
(define-fun hash_type__ref_hash_type__content__projection ((a hash_type__ref)) hash_type 
  (hash_type__content a))

(declare-fun to_rep (hash_type) (_ BitVec 32))

(declare-fun of_rep ((_ BitVec 32)) hash_type)

;; inversion_axiom
  (assert
  (forall ((x hash_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int2 ((x hash_type)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x hash_type)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep1 ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep1 (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__p__my_sets__set__capacity count_type)(rec__p__my_sets__set__modulus hash_type)))))
(define-fun us_split_discrs_rec__p__my_sets__set__capacity__projection ((a us_split_discrs)) count_type 
  (rec__p__my_sets__set__capacity a))

(define-fun us_split_discrs_rec__p__my_sets__set__modulus__projection ((a us_split_discrs)) hash_type 
  (rec__p__my_sets__set__modulus a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__my_sets__set us_main_type)))))
(define-fun us_split_fields_rec__p__my_sets__set__projection ((a us_split_fields)) us_main_type 
  (rec__p__my_sets__set a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep1
                           (rec__p__my_sets__set__capacity
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__p__my_sets__set__capacity
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__p__my_sets__set__modulus
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__p__my_sets__set__modulus
                                                  (us_split_discrs1 b)))))
                        (= (us_main_eq
                           (rec__p__my_sets__set (us_split_fields1 a))
                           (rec__p__my_sets__set (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__p__my_sets__set__capacity1 Int)
  (rec__p__my_sets__set__modulus1 (_ BitVec 32))
  (a us_split_discrs)) Bool (and
                            (= rec__p__my_sets__set__capacity1 (to_rep1
                                                               (rec__p__my_sets__set__capacity
                                                               a)))
                            (= rec__p__my_sets__set__modulus1 (to_rep
                                                              (rec__p__my_sets__set__modulus
                                                              a)))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const p__my_sets__set__capacity__first__bit Int)

(declare-const p__my_sets__set__capacity__last__bit Int)

(declare-const p__my_sets__set__capacity__position Int)

;; p__my_sets__set__capacity__first__bit_axiom
  (assert (<= 0 p__my_sets__set__capacity__first__bit))

;; p__my_sets__set__capacity__last__bit_axiom
  (assert
  (< p__my_sets__set__capacity__first__bit p__my_sets__set__capacity__last__bit))

;; p__my_sets__set__capacity__position_axiom
  (assert (<= 0 p__my_sets__set__capacity__position))

(declare-const p__my_sets__set__modulus__first__bit Int)

(declare-const p__my_sets__set__modulus__last__bit Int)

(declare-const p__my_sets__set__modulus__position Int)

;; p__my_sets__set__modulus__first__bit_axiom
  (assert (<= 0 p__my_sets__set__modulus__first__bit))

;; p__my_sets__set__modulus__last__bit_axiom
  (assert
  (< p__my_sets__set__modulus__first__bit p__my_sets__set__modulus__last__bit))

;; p__my_sets__set__modulus__position_axiom
  (assert (<= 0 p__my_sets__set__modulus__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep)))))
(define-fun set__ref_set__content__projection ((a set__ref)) us_rep (set__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun dynamic_invariant ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_274)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and
     (<= result (to_rep1
                (rec__p__my_sets__set__capacity (us_split_discrs1 container))))
     (dynamic_invariant result true false true true))) :pattern ((length
                                                                 container)) )))

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy3 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-const dummy4 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_253 Int)
  (temp___is_init_249 Bool) (temp___skip_constant_250 Bool)
  (temp___do_toplevel_251 Bool)
  (temp___do_typ_inv_252 Bool)) Bool (=>
                                     (or (= temp___is_init_249 true)
                                     (<= 1 100)) (in_range3 temp___expr_253)))

(declare-fun my_eq (Int Int) Bool)

(declare-fun my_eq__function_guard (Bool Int Int) Bool)

;; my_eq__post_axiom
  (assert true)

;; my_eq__def_axiom
  (assert
  (forall ((i1 Int) (i2 Int))
  (! (= (= (my_eq i1 i2) true) (= i1 i2)) :pattern ((my_eq i1 i2)) )))

(define-fun dynamic_invariant2 ((temp___expr_260 (_ BitVec 32))
  (temp___is_init_256 Bool) (temp___skip_constant_257 Bool)
  (temp___do_toplevel_258 Bool) (temp___do_typ_inv_259 Bool)) Bool true)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(declare-fun find (us_rep1 Int) Int)

(declare-fun find__function_guard (Int us_rep1 Int) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (element_type1 element_type1) Bool)

(declare-const dummy6 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_267 Int)
  (temp___is_init_263 Bool) (temp___skip_constant_264 Bool)
  (temp___do_toplevel_265 Bool)
  (temp___do_typ_inv_266 Bool)) Bool (=>
                                     (or (= temp___is_init_263 true)
                                     (<= 1 100)) (in_range4 temp___expr_267)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range5 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(define-fun oeq1 ((left1 us_rep1)
  (right1 us_rep1)) Bool (and (= (length1 left1) (length1 right1)) (ite 
                                                                   (forall
                                                                   ((n Int))
                                                                   (=>
                                                                   (and
                                                                   (<= 1 n)
                                                                   (<= n 
                                                                   (last
                                                                   left1)))
                                                                   (= 
                                                                   (get left1
                                                                   n) 
                                                                   (get
                                                                   right1 n))))
                                                                   true
                                                                   false)))

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq5 a b) (oeq1 a b)) :pattern ((user_eq5 a b)) )))

(define-fun default_initial_assumption ((temp___expr_357 us_rep1)
  (temp___skip_top_level_358 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_358 true))
                                         (= (length1 temp___expr_357) 0)))

;; find__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((item Int))
  (! (=> (dynamic_invariant3 item true true true true)
     (let ((result (find container item)))
     (and
     (and
     (forall ((container1 us_rep1) (item1 Int) (result1 Int))
     (my_eq__function_guard (my_eq item1 (get container1 result1)) item1
     (get container1 result1)))
     (=> (< 0 result)
     (and (<= result (length1 container))
     (= (my_eq item (get container result)) true)))) (dynamic_invariant
     result true false true true)))) :pattern ((find container item)) ))))

(define-fun e_elements_included ((left1 us_rep1)
  (right1 us_rep1)) Bool (ite (forall ((i Int))
                              (=> (and (<= 1 i) (<= i (length1 left1)))
                              (and (< 0 (find right1 (get left1 i)))
                              (= (get right1 (find right1 (get left1 i))) 
                              (get left1 i)))))
                         true false))

(declare-fun e_elements_included__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq7 (us_rep2 us_rep2) Bool)

(declare-const dummy7 us_rep2)

(declare-datatypes ((set__ref1 0))
(((set__refqtmk1 (set__content1 us_rep2)))))
(define-fun set__ref_set__content__2__projection ((a set__ref1)) us_rep2 
  (set__content1 a))

(declare-fun length3 (us_rep2) Int)

(declare-fun length__function_guard2 (Int us_rep2) Bool)

(declare-fun model1 (us_rep) us_rep2)

(declare-fun model__function_guard (us_rep2 us_rep) Bool)

(declare-fun oeq2 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard2 (Bool us_rep2 us_rep2) Bool)

(declare-fun is_empty (us_rep2) Bool)

(declare-fun is_empty__function_guard (Bool us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq7 a b) (oeq2 a b)) :pattern ((user_eq7 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_315 us_rep2)
  (temp___skip_top_level_316 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_316 true))
                                         (= (is_empty temp___expr_315) true)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length3 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-fun contains (us_rep2 Int) Bool)

(declare-fun contains__function_guard (Bool us_rep2 Int) Bool)

(define-fun iter_has_element ((container us_rep1)
  (position Int)) Bool (and (ite (<= 1 position) true false) (ite (<= position 
                                                             (last container))
                                                             true false)))

(declare-fun iter_has_element__function_guard (Bool us_rep1 Int) Bool)

(declare-fun elements (us_rep) us_rep1)

(declare-fun elements__function_guard (us_rep1 us_rep) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (element_type2 element_type2) Bool)

(declare-const dummy8 element_type2)

(declare-datatypes ((element_type__ref2 0))
(((element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (extended_index extended_index) Bool)

(declare-const dummy9 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

;; elements__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (elements container)))
     (and
     (and
     (and
     (and (= (length1 result) (length container))
     (forall ((temp___438 Int))
     (=>
     (and (in_range7 temp___438)
     (= (iter_has_element result temp___438) true))
     (= (contains (model1 container) (get result temp___438)) true))))
     (forall ((item Int))
     (=> (and (in_range6 item) (= (contains (model1 container) item) true))
     (and (< 0 (find result item))
     (and
     (forall ((result1 us_rep1) (item1 Int)) (my_eq__function_guard
     (my_eq (get result1 (find result1 item1)) item1)
     (get result1 (find result1 item1)) item1))
     (= (my_eq (get result (find result item)) item) true))))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (length container)))
     (= (find result (get result i)) i))))
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (length container)))
     (forall ((j Int))
     (=> (and (<= 1 j) (<= j (length container)))
     (and
     (forall ((result1 us_rep1) (i1 Int) (j1 Int)) (my_eq__function_guard
     (my_eq (get result1 i1) (get result1 j1)) (get result1 i1)
     (get result1 j1)))
     (=> (= (my_eq (get result i) (get result j)) true) (= i j))))))))) :pattern (
  (elements container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (let ((result (oeq left1 right1)))
     (and
     (= (= result true)
     (and (= (length left1) (length right1))
     (= (e_elements_included (elements left1) (elements right1)) true)))
     (= (= result true)
     (and (= (e_elements_included (elements left1) (elements right1)) true)
     (= (e_elements_included (elements right1) (elements left1)) true))))) :pattern (
  (oeq left1 right1)) )))

(define-fun dynamic_invariant4 ((temp___expr_307 Int)
  (temp___is_init_303 Bool) (temp___skip_constant_304 Bool)
  (temp___do_toplevel_305 Bool)
  (temp___do_typ_inv_306 Bool)) Bool (=>
                                     (or (= temp___is_init_303 true)
                                     (<= 1 100)) (in_range6 temp___expr_307)))

;; contains__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((item Int))
  (! (=> (dynamic_invariant4 item true true true true)
     (and
     (forall ((item1 Int) (e Int)) (my_eq__function_guard (my_eq e item1) e
     item1))
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range6 e) (= (contains container e) true))
     (= (my_eq e item) true))) (= (contains container item) true))))) :pattern (
  (contains container item)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep2)) (! (dynamic_invariant (length3 container)
  true false true true) :pattern ((length3 container)) )))

(declare-fun ole (us_rep2 us_rep2) Bool)

(declare-fun ole__function_guard (Bool us_rep2 us_rep2) Bool)

;; ole__post_axiom
  (assert
  (forall ((left1 us_rep2) (right1 us_rep2))
  (! (= (= (ole left1 right1) true)
     (forall ((item Int))
     (=> (and (in_range6 item) (= (contains left1 item) true))
     (= (contains right1 item) true)))) :pattern ((ole left1 right1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left1 us_rep2) (right1 us_rep2))
  (! (= (= (oeq2 left1 right1) true)
     (and (= (ole left1 right1) true) (= (ole right1 left1) true))) :pattern (
  (oeq2 left1 right1)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (is_empty container)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range6 item) (= (contains container item) true)))))
     (= (= result true) (= (length3 container) 0)))) :pattern ((is_empty
                                                               container)) )))

(define-fun dynamic_invariant5 ((temp___expr_349 Int)
  (temp___is_init_345 Bool) (temp___skip_constant_346 Bool)
  (temp___do_toplevel_347 Bool)
  (temp___do_typ_inv_348 Bool)) Bool (=>
                                     (or (= temp___is_init_345 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_349)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant result true false
     true true))) :pattern ((length1 container)) )))

(declare-sort element_type3 0)

(declare-fun element_typeqtint3 (element_type3) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type3))
  (and (<= 1 (element_typeqtint3 i)) (<= (element_typeqtint3 i) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (element_type3 element_type3) Bool)

(declare-const dummy10 element_type3)

(declare-datatypes ((element_type__ref3 0))
(((element_type__refqtmk3 (element_type__content3 element_type3)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref3)) element_type3 
  (element_type__content3 a))

(define-fun dynamic_invariant6 ((temp___expr_342 Int)
  (temp___is_init_338 Bool) (temp___skip_constant_339 Bool)
  (temp___do_toplevel_340 Bool)
  (temp___do_typ_inv_341 Bool)) Bool (=>
                                     (or (= temp___is_init_338 true)
                                     (<= 1 100)) (in_range8 temp___expr_342)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant5 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant6 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(assert
;; defqtvc
 ;; File "a-cfhase.ads", line 890, characters 0-0
  (not
  (let ((o right))
  (let ((o1 (length o)))
  (=>
  (and (dynamic_invariant o1 true false true true)
  (<= o1 (to_rep1 (rec__p__my_sets__set__capacity (us_split_discrs1 o)))))
  (in_range2 (- 2147483647 o1)))))))
(check-sat)
(exit)
