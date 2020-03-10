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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__use_formal_vectors__element_type__is_null_pointer Bool)(rec__use_formal_vectors__element_type__pointer_address Int)(rec__use_formal_vectors__element_type__pointer_value integer)))))
(define-fun us_rep_rec__use_formal_vectors__element_type__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__use_formal_vectors__element_type__is_null_pointer a))

(define-fun us_rep_rec__use_formal_vectors__element_type__pointer_address__projection ((a us_rep)) Int 
  (rec__use_formal_vectors__element_type__pointer_address a))

(define-fun us_rep_rec__use_formal_vectors__element_type__pointer_value__projection ((a us_rep)) integer 
  (rec__use_formal_vectors__element_type__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__use_formal_vectors__element_type__is_null_pointer
                           a) (rec__use_formal_vectors__element_type__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__use_formal_vectors__element_type__is_null_pointer
                           a) true))
                        (and
                        (= (rec__use_formal_vectors__element_type__pointer_address
                           a) (rec__use_formal_vectors__element_type__pointer_address
                              b))
                        (= (rec__use_formal_vectors__element_type__pointer_value
                           a) (rec__use_formal_vectors__element_type__pointer_value
                              b)))))
                   true false))

(define-fun rec__use_formal_vectors__element_type__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__use_formal_vectors__element_type__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__use_formal_vectors__element_type__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) us_rep 
  (element_type__content a))

(declare-fun model1 (us_rep) Int)

(declare-fun model__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_193 us_rep)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        temp___expr_193) true)))

(define-fun default_initial_assumption ((temp___expr_194 us_rep)
  (temp___skip_top_level_195 Bool)) Bool (= (rec__use_formal_vectors__element_type__is_null_pointer
                                            temp___expr_194) true))

(declare-sort element_model 0)

(declare-fun element_modelqtint (element_model) Int)

;; element_model'axiom
  (assert
  (forall ((i element_model))
  (and (<= (- 2147483648) (element_modelqtint i))
  (<= (element_modelqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (element_model element_model) Bool)

(declare-const dummy2 element_model)

(declare-datatypes ((element_model__ref 0))
(((element_model__refqtmk (element_model__content element_model)))))
(define-fun element_model__ref_element_model__content__projection ((a element_model__ref)) element_model 
  (element_model__content a))

(define-fun dynamic_invariant1 ((temp___expr_200 Int)
  (temp___is_init_196 Bool) (temp___skip_constant_197 Bool)
  (temp___do_toplevel_198 Bool)
  (temp___do_typ_inv_199 Bool)) Bool (=>
                                     (or (= temp___is_init_196 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_200)))

;; model__post_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (model1 x)))
     (=> (model__function_guard result x) (dynamic_invariant1 result true
     false true true)))) :pattern ((model1 x)) )))

;; model__def_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (dynamic_invariant x true true true true)
     (= (model1 x) (to_rep
                   (rec__use_formal_vectors__element_type__pointer_value x)))) :pattern (
  (model1 x)) )))

(declare-const dummy3 us_rep)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 us_rep)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) us_rep 
  (element_type__content1 a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__use_formal_vectors__my_vect__element_access__is_null_pointer Bool)(rec__use_formal_vectors__my_vect__element_access__pointer_address Int)(rec__use_formal_vectors__my_vect__element_access__pointer_value us_rep)))))
(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__use_formal_vectors__my_vect__element_access__is_null_pointer a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__pointer_address__projection ((a us_rep1)) Int 
  (rec__use_formal_vectors__my_vect__element_access__pointer_address a))

(define-fun us_rep_rec__use_formal_vectors__my_vect__element_access__pointer_value__projection ((a us_rep1)) us_rep 
  (rec__use_formal_vectors__my_vect__element_access__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep1)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep1 
  (us_rep__content1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                            a) (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__use_formal_vectors__my_vect__element_access__pointer_address
                            a) (rec__use_formal_vectors__my_vect__element_access__pointer_address
                               b))
                         (= (rec__use_formal_vectors__my_vect__element_access__pointer_value
                            a) (rec__use_formal_vectors__my_vect__element_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__use_formal_vectors__my_vect__element_access__pointer_value__pred ((a us_rep1)) Bool 
  (not
  (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
     us_null_pointer1) true))

(declare-const dummy4 us_rep1)

(declare-datatypes ((element_access__ref 0))
(((element_access__refqtmk (element_access__content us_rep1)))))
(define-fun element_access__ref_element_access__content__projection ((a element_access__ref)) us_rep1 
  (element_access__content a))

(define-fun dynamic_invariant2 ((temp___expr_225 us_rep1)
  (temp___is_init_221 Bool) (temp___skip_constant_222 Bool)
  (temp___do_toplevel_223 Bool)
  (temp___do_typ_inv_224 Bool)) Bool (=>
                                     (not
                                     (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                        temp___expr_225) true))
                                     (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        (rec__use_formal_vectors__my_vect__element_access__pointer_value
                                        temp___expr_225)) true))))

(define-fun default_initial_assumption1 ((temp___expr_226 us_rep1)
  (temp___skip_top_level_227 Bool)) Bool (= (rec__use_formal_vectors__my_vect__element_access__is_null_pointer
                                            temp___expr_226) true))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_211 us_rep)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (not
                                     (= (rec__use_formal_vectors__element_type__is_null_pointer
                                        temp___expr_211) true)))

(define-fun default_initial_assumption2 ((temp___expr_212 us_rep)
  (temp___skip_top_level_213 Bool)) Bool (= (rec__use_formal_vectors__element_type__is_null_pointer
                                            temp___expr_212) true))

(assert
;; defqtvc
 ;; File "formal_vectors.adb", line 71, characters 0-0
  (not
  (forall ((from__pointer_value us_rep) (from__pointer_address Int)
  (from__is_null_pointer Bool) (to____pointer_value us_rep)
  (to____pointer_address Int) (to____is_null_pointer Bool))
  (=> (dynamic_invariant2
  (us_repqtmk1 from__is_null_pointer from__pointer_address
  from__pointer_value) true false true true)
  (=> (dynamic_invariant2
  (us_repqtmk1 to____is_null_pointer to____pointer_address
  to____pointer_value) true false true true)
  (=>
  (not
  (= (bool_eq1
     (us_repqtmk1 from__is_null_pointer from__pointer_address
     from__pointer_value) us_null_pointer1) true))
  (=>
  (not
  (= (bool_eq1
     (us_repqtmk1 to____is_null_pointer to____pointer_address
     to____pointer_value) us_null_pointer1) true))
  (rec__use_formal_vectors__my_vect__element_access__pointer_value__pred
  (us_repqtmk1 from__is_null_pointer from__pointer_address
  from__pointer_value)))))))))
(check-sat)
(exit)
