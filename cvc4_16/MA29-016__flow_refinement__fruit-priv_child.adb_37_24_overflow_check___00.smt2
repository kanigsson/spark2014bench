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

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-fun price_of_fruit_salad (us_private us_private Int Int Int Int
  Int) Int)

(declare-fun price_of_fruit_salad__function_guard (Int us_private us_private
  Int Int Int Int Int) Bool)

;; price_of_fruit_salad__post_axiom
  (assert
  (forall ((ada___fruit__pub_child__apples_in_fruit_salad us_private)
  (ada___fruit__pub_child__oranges_in_fruit_salad us_private))
  (forall ((fruit__price_of_orange Int) (fruit__apples Int)
  (fruit__oranges Int) (fruit__price_of_apple Int)
  (ada___fruit__priv_child__extra_cost Int))
  (! (=>
     (and
     (and
     (and
     (and (dynamic_invariant fruit__price_of_orange true true true true)
     (dynamic_invariant fruit__apples true true true true))
     (dynamic_invariant fruit__oranges true true true true))
     (dynamic_invariant fruit__price_of_apple true true true true))
     (dynamic_invariant ada___fruit__priv_child__extra_cost true true true
     true))
     (let ((result (price_of_fruit_salad
                   ada___fruit__pub_child__apples_in_fruit_salad
                   ada___fruit__pub_child__oranges_in_fruit_salad
                   fruit__price_of_orange fruit__apples fruit__oranges
                   fruit__price_of_apple ada___fruit__priv_child__extra_cost)))
     (=> (price_of_fruit_salad__function_guard result
     ada___fruit__pub_child__apples_in_fruit_salad
     ada___fruit__pub_child__oranges_in_fruit_salad fruit__price_of_orange
     fruit__apples fruit__oranges fruit__price_of_apple
     ada___fruit__priv_child__extra_cost) (dynamic_invariant result true
     false true true)))) :pattern ((price_of_fruit_salad
                                   ada___fruit__pub_child__apples_in_fruit_salad
                                   ada___fruit__pub_child__oranges_in_fruit_salad
                                   fruit__price_of_orange fruit__apples
                                   fruit__oranges fruit__price_of_apple
                                   ada___fruit__priv_child__extra_cost)) ))))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "fruit-priv_child.ads", line 21, characters 0-0
  (not
  (forall ((price_of_apple Int) (price_of_orange Int) (profit Int)
  (extra_cost Int) (money Int) (fruit_salads Int) (apples Int) (oranges Int)
  (apples_in_fruit_salad us_private) (oranges_in_fruit_salad us_private)
  (price_of_apple1 Int) (price_of_orange1 Int) (extra_cost1 Int)
  (fruit_salads1 Int) (apples1 Int) (oranges1 Int))
  (=> (dynamic_invariant profit false false true true)
  (=> (dynamic_invariant extra_cost true false true true)
  (=> (dynamic_invariant apples true false true true)
  (=> (dynamic_invariant oranges true false true true)
  (=> (dynamic_invariant price_of_apple true false true true)
  (=> (dynamic_invariant price_of_orange true false true true)
  (=> (dynamic_invariant money false false true true)
  (=> (dynamic_invariant fruit_salads false false true true)
  (=> (dynamic_invariant fruit_salads1 true true true true)
  (=> (dynamic_invariant price_of_orange1 true true true true)
  (=> (dynamic_invariant apples1 true true true true)
  (=> (dynamic_invariant oranges1 true true true true)
  (=> (dynamic_invariant price_of_apple1 true true true true)
  (=> (dynamic_invariant extra_cost1 true true true true)
  (let ((o (price_of_fruit_salad apples_in_fruit_salad oranges_in_fruit_salad
           price_of_orange1 apples1 oranges1 price_of_apple1 extra_cost1)))
  (=>
  (and (price_of_fruit_salad__function_guard o apples_in_fruit_salad
  oranges_in_fruit_salad price_of_orange1 apples1 oranges1 price_of_apple1
  extra_cost1) (dynamic_invariant o true false true true))
  (let ((o1 (* fruit_salads1 o)))
  (=> (in_range o1)
  (=> (in_range1 o1)
  (forall ((money1 Int))
  (=> (= money1 o1)
  (let ((o2 (get_price_of_apple price_of_apple1)))
  (=>
  (and (get_price_of_apple__function_guard o2 price_of_apple1)
  (and (dynamic_invariant o2 true false true true) (= o2 price_of_apple1)))
  (let ((o3 (* apples1 o2)))
  (=> (in_range o3)
  (let ((o4 (+ money1 o3)))
  (=> (in_range o4)
  (=> (in_range1 o4)
  (forall ((money2 Int))
  (=> (= money2 o4)
  (let ((o5 (get_price_of_orange price_of_orange1)))
  (=>
  (and (get_price_of_orange__function_guard o5 price_of_orange1)
  (and (dynamic_invariant o5 true false true true) (= o5 price_of_orange1)))
  (let ((o6 (* oranges1 o5))) (=> (in_range o6) (in_range (+ money2 o6)))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
