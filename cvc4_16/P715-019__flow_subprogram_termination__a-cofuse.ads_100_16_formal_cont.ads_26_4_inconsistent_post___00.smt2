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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((set__ref 0))
(((set__refqtmk (set__content us_rep)))))
(define-fun set__ref_set__content__2__projection ((a set__ref)) us_rep 
  (set__content a))

(declare-fun ole (us_rep us_rep) Bool)

(declare-fun ole__function_guard (Bool us_rep us_rep) Bool)

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_240 us_rep)
  (temp___skip_top_level_241 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_241 true))
                                         (= (is_empty temp___expr_240) true)))

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun my_equal_02 (Int Int) Bool)

(declare-fun my_equal_02__function_guard (Bool Int Int) Bool)

;; my_equal_02__post_axiom
  (assert true)

;; my_equal_02__def_axiom
  (assert
  (forall ((a Int) (b Int))
  (! (= (= (my_equal_02 a b) true) (= a b)) :pattern ((my_equal_02 a b)) )))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (count_type count_type) Bool)

(declare-const dummy2 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_223 Int)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (or (= temp___is_init_219 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_223)))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(declare-fun contains (us_rep Int) Bool)

(declare-fun contains__function_guard (Bool us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_232 Int)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (=>
                                     (or (= temp___is_init_228 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_232)))

;; contains__post_axiom
  (assert
  (forall ((container us_rep))
  (forall ((item Int))
  (! (=> (dynamic_invariant2 item true true true true)
     (and
     (forall ((item1 Int) (e Int)) (my_equal_02__function_guard
     (my_equal_02 e item1) e item1))
     (=> (= (distinct 1 0) true)
     (=>
     (exists ((e Int))
     (and (and (in_range3 e) (= (contains container e) true))
     (= (my_equal_02 e item) true))) (= (contains container item) true))))) :pattern (
  (contains container item)) ))))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((container us_rep)) (! (dynamic_invariant1 (length container) true
  false true true) :pattern ((length container)) )))

;; ole__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (ole left1 right1) true)
     (forall ((item Int))
     (=> (and (in_range3 item) (= (contains left1 item) true))
     (= (contains right1 item) true)))) :pattern ((ole left1 right1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left1 us_rep) (right1 us_rep))
  (! (= (= (oeq left1 right1) true)
     (and (= (ole left1 right1) true) (= (ole right1 left1) true))) :pattern (
  (oeq left1 right1)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (is_empty container)))
     (and
     (= (= result true)
     (forall ((item Int))
     (not (and (in_range3 item) (= (contains container item) true)))))
     (= (= result true) (= (length container) 0)))) :pattern ((is_empty
                                                              container)) )))

(assert
;; defqtvc
 ;; File "a-cofuse.ads", line 96, characters 0-0
  (not
  (forall ((formal_cont__new_set_02__Oeq__result Bool))
  (not
  (= (= formal_cont__new_set_02__Oeq__result true)
  (and (= (ole left right) true) (= (ole right left) true)))))))
(check-sat)
(exit)
