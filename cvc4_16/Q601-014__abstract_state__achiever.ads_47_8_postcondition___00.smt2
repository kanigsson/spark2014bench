;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun get_internal_state (Int) Int)

(declare-fun get_internal_state__function_guard (Int Int) Bool)

(declare-sort internal_state 0)

(declare-fun internal_stateqtint (internal_state) Int)

;; internal_state'axiom
  (assert
  (forall ((i internal_state))
  (and (<= (- 2147483648) (internal_stateqtint i))
  (<= (internal_stateqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (internal_state internal_state) Bool)

(declare-const dummy internal_state)

(declare-datatypes ((internal_state__ref 0))
(((internal_state__refqtmk (internal_state__content internal_state)))))
(define-fun internal_state__ref_internal_state__content__projection ((a internal_state__ref)) internal_state 
  (internal_state__content a))

(define-fun dynamic_invariant ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_178)))

;; get_internal_state__post_axiom
  (assert
  (forall ((achiever__my_internal_state Int))
  (! (=> (dynamic_invariant achiever__my_internal_state true true true true)
     (let ((result (get_internal_state achiever__my_internal_state)))
     (=> (get_internal_state__function_guard result
     achiever__my_internal_state) (dynamic_invariant result true false true
     true)))) :pattern ((get_internal_state achiever__my_internal_state)) )))

;; get_internal_state__def_axiom
  (assert
  (forall ((achiever__my_internal_state Int))
  (! (=> (dynamic_invariant achiever__my_internal_state true true true true)
     (= (get_internal_state achiever__my_internal_state) achiever__my_internal_state)) :pattern (
  (get_internal_state achiever__my_internal_state)) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__sc_status_type__duplicate_status_type__prime Bool)(rec__sc_status_type__duplicate_status_type__shadow Bool)))))
(define-fun us_split_fields_rec__sc_status_type__duplicate_status_type__prime__projection ((a us_split_fields)) Bool 
  (rec__sc_status_type__duplicate_status_type__prime a))

(define-fun us_split_fields_rec__sc_status_type__duplicate_status_type__shadow__projection ((a us_split_fields)) Bool 
  (rec__sc_status_type__duplicate_status_type__shadow a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__sc_status_type__duplicate_status_type__prime
                                (us_split_fields1 a)) 1 0) (ite (rec__sc_status_type__duplicate_status_type__prime
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__sc_status_type__duplicate_status_type__shadow
                                (us_split_fields1 a)) 1 0) (ite (rec__sc_status_type__duplicate_status_type__shadow
                                                                (us_split_fields1
                                                                b)) 1 0)))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const sc_status_type__duplicate_status_type__prime__first__bit Int)

(declare-const sc_status_type__duplicate_status_type__prime__last__bit Int)

(declare-const sc_status_type__duplicate_status_type__prime__position Int)

;; sc_status_type__duplicate_status_type__prime__first__bit_axiom
  (assert (<= 0 sc_status_type__duplicate_status_type__prime__first__bit))

;; sc_status_type__duplicate_status_type__prime__last__bit_axiom
  (assert
  (< sc_status_type__duplicate_status_type__prime__first__bit sc_status_type__duplicate_status_type__prime__last__bit))

;; sc_status_type__duplicate_status_type__prime__position_axiom
  (assert (<= 0 sc_status_type__duplicate_status_type__prime__position))

(declare-const sc_status_type__duplicate_status_type__shadow__first__bit Int)

(declare-const sc_status_type__duplicate_status_type__shadow__last__bit Int)

(declare-const sc_status_type__duplicate_status_type__shadow__position Int)

;; sc_status_type__duplicate_status_type__shadow__first__bit_axiom
  (assert (<= 0 sc_status_type__duplicate_status_type__shadow__first__bit))

;; sc_status_type__duplicate_status_type__shadow__last__bit_axiom
  (assert
  (< sc_status_type__duplicate_status_type__shadow__first__bit sc_status_type__duplicate_status_type__shadow__last__bit))

;; sc_status_type__duplicate_status_type__shadow__position_axiom
  (assert (<= 0 sc_status_type__duplicate_status_type__shadow__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((duplicate_status_type__ref 0))
(((duplicate_status_type__refqtmk (duplicate_status_type__content us_rep)))))
(define-fun duplicate_status_type__ref_duplicate_status_type__content__projection ((a duplicate_status_type__ref)) us_rep 
  (duplicate_status_type__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__sc_status_type__object_type__sc_state us_rep)))))
(define-fun us_split_fields_rec__sc_status_type__object_type__sc_state__projection ((a us_split_fields2)) us_rep 
  (rec__sc_status_type__object_type__sc_state a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (bool_eq
                            (rec__sc_status_type__object_type__sc_state
                            (us_split_fields3 a))
                            (rec__sc_status_type__object_type__sc_state
                            (us_split_fields3 b))) true)
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const sc_status_type__object_type__sc_state__first__bit Int)

(declare-const sc_status_type__object_type__sc_state__last__bit Int)

(declare-const sc_status_type__object_type__sc_state__position Int)

;; sc_status_type__object_type__sc_state__first__bit_axiom
  (assert (<= 0 sc_status_type__object_type__sc_state__first__bit))

;; sc_status_type__object_type__sc_state__last__bit_axiom
  (assert
  (< sc_status_type__object_type__sc_state__first__bit sc_status_type__object_type__sc_state__last__bit))

;; sc_status_type__object_type__sc_state__position_axiom
  (assert (<= 0 sc_status_type__object_type__sc_state__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((object_type__ref 0))
(((object_type__refqtmk (object_type__content us_rep1)))))
(define-fun object_type__ref_object_type__content__projection ((a object_type__ref)) us_rep1 
  (object_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun get_state_item (us_split_fields2) us_rep1)

(declare-fun get_state_item__function_guard (us_rep1 us_split_fields2) Bool)

;; get_state_item__post_axiom
  (assert true)

;; get_state_item__def_axiom
  (assert
  (forall ((achiever__state_item__fields us_split_fields2))
  (! (= (get_state_item achiever__state_item__fields) (us_repqtmk1
                                                      achiever__state_item__fields)) :pattern (
  (get_state_item achiever__state_item__fields)) )))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

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

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

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

(declare-fun prf_do_something ((_ BitVec 8) Int Int Int) Bool)

(declare-fun prf_do_something__function_guard (Bool (_ BitVec 8) Int Int
  Int) Bool)

(declare-sort st_type 0)

(define-fun in_range2 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x0F)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq3 (st_type st_type) Bool)

(declare-const dummy3 st_type)

(declare-datatypes ((st_type__ref 0))
(((st_type__refqtmk (st_type__content st_type)))))
(define-fun st_type__ref_st_type__content__projection ((a st_type__ref)) st_type 
  (st_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_164 (_ BitVec 8))
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (bvule #x00 #x0F)) (in_range2
                                     temp___expr_164)))

(declare-sort op_type 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (op_type op_type) Bool)

(declare-const dummy4 op_type)

(declare-datatypes ((op_type__ref 0))
(((op_type__refqtmk (op_type__content op_type)))))
(define-fun op_type__ref_op_type__content__projection ((a op_type__ref)) op_type 
  (op_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 0 3)) (in_range3 temp___expr_171)))

;; prf_do_something__post_axiom
  (assert true)

;; prf_do_something__def_axiom
  (assert
  (forall ((st (_ BitVec 8)))
  (forall ((op Int) (before Int) (after Int))
  (! (= (prf_do_something st op before after) true) :pattern ((prf_do_something
                                                              st op before
                                                              after)) ))))

(declare-fun prf_do_stuff ((_ BitVec 8) Int Int) Bool)

(declare-fun prf_do_stuff__function_guard (Bool (_ BitVec 8) Int Int) Bool)

;; prf_do_stuff__post_axiom
  (assert true)

;; prf_do_stuff__def_axiom
  (assert
  (forall ((st (_ BitVec 8)))
  (forall ((before Int) (after Int))
  (! (= (prf_do_stuff st before after) true) :pattern ((prf_do_stuff st
                                                       before after)) ))))

(declare-const st (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun read (us_rep1) Bool)

(declare-fun read__function_guard (Bool us_rep1) Bool)

;; read__post_axiom
  (assert true)

(declare-const c2b (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c3b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

;; c2b__def_axiom
  (assert (= c2b st))

;; c3b__def_axiom
  (assert (= c3b 0))

(assert
;; defqtvc
 ;; File "achiever.ads", line 34, characters 0-0
  (not
  (forall ((my_internal_state Int) (state_item__split_fields us_split_fields)
  (my_internal_state1 Int))
  (=> (= my_internal_state1 my_internal_state)
  (=> (dynamic_invariant1 st true false true true)
  (=> (dynamic_invariant my_internal_state true false true true)
  (=>
  (forall ((state_item__split_fields1 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (=>
  (forall ((state_item__split_fields1 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (=>
  (forall ((state_item__split_fields1 us_split_fields)) (read__function_guard
  (read
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))))
  (=>
  (forall ((state_item__split_fields1 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (=>
  (forall ((state_item__split_fields1 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (=>
  (forall ((state_item__split_fields1 us_split_fields)) (read__function_guard
  (read
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((state_item__split_fields1 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1))))
  (forall ((state_item__split_fields1 us_split_fields))
  (=>
  (let ((o (us_repqtmk1
           (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields)))))
  (let ((o1 (read o)))
  (and (read__function_guard o1 o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o1 true) false true))
  (ite (= spark__branch true)
  (and (= st c2b)
  (and (dynamic_invariant1 c2b true false true true) (dynamic_invariant2 
  c3b true false true true)))
  (= state_item__split_fields1 state_item__split_fields)))))))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int) (usf Int))
  (prf_do_something__function_guard
  (prf_do_something st 0 usf (get_internal_state my_internal_state2)) 
  st 0 usf (get_internal_state my_internal_state2)))
  (=>
  (forall ((state_item__split_fields2 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2))))
  (=>
  (forall ((state_item__split_fields2 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2))))
  (=>
  (forall ((state_item__split_fields2 us_split_fields)) (read__function_guard
  (read
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2))))
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2)))))
  (=>
  (=>
  (= (not (read
          (get_state_item
          (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields))))) true)
  (and
  (= (prf_do_something st 0 (get_internal_state my_internal_state)
     (get_internal_state my_internal_state)) true)
  (= (read
     (get_state_item
     (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))) true)))
  (=>
  (forall ((state_item__split_fields2 us_split_fields))
  (get_state_item__function_guard
  (get_state_item
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2)))
  (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields2))))
  (=>
  (=>
  (= (read
     (get_state_item
     (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields)))) true)
  (= (bool_eq1
     (get_state_item
     (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields1)))
     (get_state_item
     (us_split_fieldsqtmk1 (us_repqtmk state_item__split_fields)))) true))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int)) (get_internal_state__function_guard
  (get_internal_state my_internal_state2) my_internal_state2))
  (=>
  (forall ((my_internal_state2 Int) (my_internal_state3 Int))
  (prf_do_stuff__function_guard
  (prf_do_stuff st (get_internal_state my_internal_state3)
  (get_internal_state my_internal_state2)) st
  (get_internal_state my_internal_state3)
  (get_internal_state my_internal_state2)))
  (= (prf_do_stuff st (get_internal_state my_internal_state1)
     (get_internal_state my_internal_state)) true)))))))))))))))))))))))))))))))
(check-sat)