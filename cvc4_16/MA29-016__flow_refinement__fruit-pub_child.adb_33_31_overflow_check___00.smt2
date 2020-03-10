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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun get_price_of_apple (Int) Int)

(declare-fun get_price_of_apple__function_guard (Int Int) Bool)

;; get_price_of_apple__post_axiom
  (assert
  (forall ((fruit__price_of_apple Int))
  (! (=> (dynamic_invariant fruit__price_of_apple true true true true)
     (let ((result (get_price_of_apple fruit__price_of_apple)))
     (=> (get_price_of_apple__function_guard result fruit__price_of_apple)
     (dynamic_invariant result true false true true)))) :pattern ((get_price_of_apple
                                                                  fruit__price_of_apple)) )))

;; get_price_of_apple__def_axiom
  (assert
  (forall ((fruit__price_of_apple Int))
  (! (=> (dynamic_invariant fruit__price_of_apple true true true true)
     (= (get_price_of_apple fruit__price_of_apple) fruit__price_of_apple)) :pattern (
  (get_price_of_apple fruit__price_of_apple)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun get_price_of_orange (Int) Int)

(declare-fun get_price_of_orange__function_guard (Int Int) Bool)

;; get_price_of_orange__post_axiom
  (assert
  (forall ((fruit__price_of_orange Int))
  (! (=> (dynamic_invariant fruit__price_of_orange true true true true)
     (let ((result (get_price_of_orange fruit__price_of_orange)))
     (=> (get_price_of_orange__function_guard result fruit__price_of_orange)
     (dynamic_invariant result true false true true)))) :pattern ((get_price_of_orange
                                                                  fruit__price_of_orange)) )))

;; get_price_of_orange__def_axiom
  (assert
  (forall ((fruit__price_of_orange Int))
  (! (=> (dynamic_invariant fruit__price_of_orange true true true true)
     (= (get_price_of_orange fruit__price_of_orange) fruit__price_of_orange)) :pattern (
  (get_price_of_orange fruit__price_of_orange)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "fruit-pub_child.ads", line 13, characters 0-0
  (not
  (forall ((price_of_apple Int) (price_of_orange Int)
  (apples_in_fruit_salad Int) (oranges_in_fruit_salad Int))
  (=> (dynamic_invariant apples_in_fruit_salad true false true true)
  (=> (dynamic_invariant oranges_in_fruit_salad true false true true)
  (=> (dynamic_invariant price_of_apple true false true true)
  (=> (dynamic_invariant price_of_orange true false true true)
  (let ((o (get_price_of_orange price_of_orange)))
  (=>
  (and (get_price_of_orange__function_guard o price_of_orange)
  (and (dynamic_invariant o true false true true) (= o price_of_orange)))
  (let ((o1 (get_price_of_apple price_of_apple)))
  (=>
  (and (get_price_of_apple__function_guard o1 price_of_apple)
  (and (dynamic_invariant o1 true false true true) (= o1 price_of_apple)))
  (=> (<= o o1)
  (let ((o2 (+ apples_in_fruit_salad oranges_in_fruit_salad)))
  (=> (in_range o2)
  (let ((o3 (get_price_of_apple price_of_apple)))
  (=>
  (and (get_price_of_apple__function_guard o3 price_of_apple)
  (and (dynamic_invariant o3 true false true true) (= o3 price_of_apple)))
  (in_range (* o3 o2))))))))))))))))))
(check-sat)
(exit)
