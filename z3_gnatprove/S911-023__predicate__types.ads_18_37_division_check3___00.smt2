(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-const bit_index Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tlength_typeB 0)

(declare-fun tlength_typeBqtint (tlength_typeB) Int)

;; tlength_typeB'axiom
  (assert
  (forall ((i tlength_typeB))
  (and (<= (- 2147483648) (tlength_typeBqtint i))
  (<= (tlength_typeBqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (tlength_typeB tlength_typeB) Bool)

(declare-const dummy tlength_typeB)

(declare-datatypes ()
((tlength_typeB__ref
 (tlength_typeB__refqtmk (tlength_typeB__content tlength_typeB)))))
(define-fun tlength_typeB__ref_tlength_typeB__content__projection ((a tlength_typeB__ref)) tlength_typeB 
  (tlength_typeB__content a))

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (length_type length_type) Bool)

(declare-const dummy1 length_type)

(declare-datatypes ()
((length_type__ref (length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(declare-sort bit_index_type 0)

(declare-fun bit_index_typeqtint (bit_index_type) Int)

;; bit_index_type'axiom
  (assert
  (forall ((i bit_index_type))
  (and (<= 1 (bit_index_typeqtint i))
  (<= (bit_index_typeqtint i) 17179869176))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 17179869176)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (bit_index_type bit_index_type) Bool)

(declare-const dummy2 bit_index_type)

(declare-datatypes ()
((bit_index_type__ref
 (bit_index_type__refqtmk (bit_index_type__content bit_index_type)))))
(define-fun bit_index_type__ref_bit_index_type__content__projection ((a bit_index_type__ref)) bit_index_type 
  (bit_index_type__content a))

(define-fun dynamic_invariant ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 1 17179869176)) (in_range2
                                     temp___expr_191)))

(define-fun dynamic_invariant1 ((temp___expr_170 Int)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (or (= temp___is_init_166 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_170)))

;; Assume
  (assert (dynamic_invariant bit_index true false true true))

(assert
;; defqtvc
 ;; File "types.ads", line 17, characters 0-0
  (not (not (= 8 0))))
(check-sat)
