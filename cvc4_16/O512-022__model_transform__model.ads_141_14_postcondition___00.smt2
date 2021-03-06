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

(declare-sort name_t 0)

(declare-fun name_tqtint (name_t) Int)

;; name_t'axiom
  (assert
  (forall ((i name_t))
  (and (<= 0 (name_tqtint i)) (<= (name_tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (name_t name_t) Bool)

(declare-const dummy name_t)

(declare-datatypes ((name_t__ref 0))
(((name_t__refqtmk (name_t__content name_t)))))
(define-fun name_t__ref_name_t__content__projection ((a name_t__ref)) name_t 
  (name_t__content a))

(define-fun to_rep ((x name_t)) Int (name_tqtint x))

(declare-fun of_rep (Int) name_t)

;; inversion_axiom
  (assert
  (forall ((x name_t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x name_t)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__model__uml_action__name_data name_t)))))
(define-fun us_split_fields_rec__model__uml_action__name_data__projection ((a us_split_fields)) name_t 
  (rec__model__uml_action__name_data a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__4__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__model__uml_action__name_data
                           (us_split_fields1 a))) (to_rep
                                                  (rec__model__uml_action__name_data
                                                  (us_split_fields1 b))))
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

(declare-const model__uml_action__name_data__first__bit Int)

(declare-const model__uml_action__name_data__last__bit Int)

(declare-const model__uml_action__name_data__position Int)

;; model__uml_action__name_data__first__bit_axiom
  (assert (<= 0 model__uml_action__name_data__first__bit))

;; model__uml_action__name_data__last__bit_axiom
  (assert
  (< model__uml_action__name_data__first__bit model__uml_action__name_data__last__bit))

;; model__uml_action__name_data__position_axiom
  (assert (<= 0 model__uml_action__name_data__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((uml_action__ref 0))
(((uml_action__refqtmk (uml_action__content us_rep)))))
(define-fun uml_action__ref_uml_action__content__projection ((a uml_action__ref)) us_rep 
  (uml_action__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_161 Int))
                           (=>
                           (and (<= a__first temp___idx_161)
                           (<= temp___idx_161 a__last))
                           (= (bool_eq (select a temp___idx_161)
                              (select b (+ (- b__first a__first) temp___idx_161))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_161 Int))
  (=> (and (<= a__first temp___idx_161) (<= temp___idx_161 a__last))
  (= (bool_eq (select a temp___idx_161)
     (select b (+ (- b__first a__first) temp___idx_161))) true))))))))

(declare-const dummy2 (Array Int us_rep))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-sort uml_action_access 0)

(declare-fun uml_action_accessqtint (uml_action_access) Int)

;; uml_action_access'axiom
  (assert
  (forall ((i uml_action_access))
  (and (<= 0 (uml_action_accessqtint i)) (<= (uml_action_accessqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (uml_action_access uml_action_access) Bool)

(declare-const dummy3 uml_action_access)

(declare-datatypes ((uml_action_access__ref 0))
(((uml_action_access__refqtmk (uml_action_access__content uml_action_access)))))
(define-fun uml_action_access__ref_uml_action_access__content__projection ((a uml_action_access__ref)) uml_action_access 
  (uml_action_access__content a))

(define-fun to_rep1 ((x uml_action_access)) Int (uml_action_accessqtint x))

(declare-fun of_rep1 (Int) uml_action_access)

;; inversion_axiom
  (assert
  (forall ((x uml_action_access))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x uml_action_access)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__model__uml_control_flow__from_data uml_action_access)(rec__model__uml_control_flow__to_data uml_action_access)))))
(define-fun us_split_fields_rec__model__uml_control_flow__from_data__projection ((a us_split_fields2)) uml_action_access 
  (rec__model__uml_control_flow__from_data a))

(define-fun us_split_fields_rec__model__uml_control_flow__to_data__projection ((a us_split_fields2)) uml_action_access 
  (rec__model__uml_control_flow__to_data a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__5__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__model__uml_control_flow__from_data
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__model__uml_control_flow__from_data
                                                   (us_split_fields3 b))))
                         (= (to_rep1
                            (rec__model__uml_control_flow__to_data
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__model__uml_control_flow__to_data
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const model__uml_control_flow__from_data__first__bit Int)

(declare-const model__uml_control_flow__from_data__last__bit Int)

(declare-const model__uml_control_flow__from_data__position Int)

;; model__uml_control_flow__from_data__first__bit_axiom
  (assert (<= 0 model__uml_control_flow__from_data__first__bit))

;; model__uml_control_flow__from_data__last__bit_axiom
  (assert
  (< model__uml_control_flow__from_data__first__bit model__uml_control_flow__from_data__last__bit))

;; model__uml_control_flow__from_data__position_axiom
  (assert (<= 0 model__uml_control_flow__from_data__position))

(declare-const model__uml_control_flow__to_data__first__bit Int)

(declare-const model__uml_control_flow__to_data__last__bit Int)

(declare-const model__uml_control_flow__to_data__position Int)

;; model__uml_control_flow__to_data__first__bit_axiom
  (assert (<= 0 model__uml_control_flow__to_data__first__bit))

;; model__uml_control_flow__to_data__last__bit_axiom
  (assert
  (< model__uml_control_flow__to_data__first__bit model__uml_control_flow__to_data__last__bit))

;; model__uml_control_flow__to_data__position_axiom
  (assert (<= 0 model__uml_control_flow__to_data__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((uml_control_flow__ref 0))
(((uml_control_flow__refqtmk (uml_control_flow__content us_rep1)))))
(define-fun uml_control_flow__ref_uml_control_flow__content__projection ((a uml_control_flow__ref)) us_rep1 
  (uml_control_flow__content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_rep1))))))
(declare-fun slide1 ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_166 Int))
                           (=>
                           (and (<= a__first temp___idx_166)
                           (<= temp___idx_166 a__last))
                           (= (bool_eq2 (select a temp___idx_166)
                              (select b (+ (- b__first a__first) temp___idx_166))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_166 Int))
  (=> (and (<= a__first temp___idx_166) (<= temp___idx_166 a__last))
  (= (bool_eq2 (select a temp___idx_166)
     (select b (+ (- b__first a__first) temp___idx_166))) true))))))))

(declare-const dummy5 (Array Int us_rep1))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size1 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-fun user_eq5 ((Array Int us_rep1) (Array Int us_rep1)) Bool)

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__model__uml_activity__owned_action_data (Array Int us_rep))(rec__model__uml_activity__owned_flow_data (Array Int us_rep1))))))
(define-fun us_split_fields_rec__model__uml_activity__owned_action_data__projection ((a us_split_fields4)) (Array Int us_rep) 
  (rec__model__uml_activity__owned_action_data a))

(define-fun us_split_fields_rec__model__uml_activity__owned_flow_data__projection ((a us_split_fields4)) (Array Int us_rep1) 
  (rec__model__uml_activity__owned_flow_data a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__6__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__6__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (bool_eq1
                            (rec__model__uml_activity__owned_action_data
                            (us_split_fields5 a)) 0 100
                            (rec__model__uml_activity__owned_action_data
                            (us_split_fields5 b)) 0 100) true)
                         (= (bool_eq3
                            (rec__model__uml_activity__owned_flow_data
                            (us_split_fields5 a)) 0 100
                            (rec__model__uml_activity__owned_flow_data
                            (us_split_fields5 b)) 0 100) true))
                    true false))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const model__uml_activity__owned_action_data__first__bit Int)

(declare-const model__uml_activity__owned_action_data__last__bit Int)

(declare-const model__uml_activity__owned_action_data__position Int)

;; model__uml_activity__owned_action_data__first__bit_axiom
  (assert (<= 0 model__uml_activity__owned_action_data__first__bit))

;; model__uml_activity__owned_action_data__last__bit_axiom
  (assert
  (< model__uml_activity__owned_action_data__first__bit model__uml_activity__owned_action_data__last__bit))

;; model__uml_activity__owned_action_data__position_axiom
  (assert (<= 0 model__uml_activity__owned_action_data__position))

(declare-const model__uml_activity__owned_flow_data__first__bit Int)

(declare-const model__uml_activity__owned_flow_data__last__bit Int)

(declare-const model__uml_activity__owned_flow_data__position Int)

;; model__uml_activity__owned_flow_data__first__bit_axiom
  (assert (<= 0 model__uml_activity__owned_flow_data__first__bit))

;; model__uml_activity__owned_flow_data__last__bit_axiom
  (assert
  (< model__uml_activity__owned_flow_data__first__bit model__uml_activity__owned_flow_data__last__bit))

;; model__uml_activity__owned_flow_data__position_axiom
  (assert (<= 0 model__uml_activity__owned_flow_data__position))

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes ((uml_activity__ref 0))
(((uml_activity__refqtmk (uml_activity__content us_rep2)))))
(define-fun uml_activity__ref_uml_activity__content__projection ((a uml_activity__ref)) us_rep2 
  (uml_activity__content a))

(declare-fun owned_action (us_rep2) (Array Int us_rep))

(declare-fun owned_action__function_guard ((Array Int us_rep) us_rep2) Bool)

;; owned_action__post_axiom
  (assert true)

;; owned_action__def_axiom
  (assert
  (forall ((self us_rep2))
  (! (= (owned_action self) (rec__model__uml_activity__owned_action_data
                            (us_split_fields5 self))) :pattern ((owned_action
                                                                self)) )))

(declare-fun owned_flow (us_rep2) (Array Int us_rep1))

(declare-fun owned_flow__function_guard ((Array Int us_rep1) us_rep2) Bool)

;; owned_flow__post_axiom
  (assert true)

;; owned_flow__def_axiom
  (assert
  (forall ((self us_rep2))
  (! (= (owned_flow self) (rec__model__uml_activity__owned_flow_data
                          (us_split_fields5 self))) :pattern ((owned_flow
                                                              self)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const val__ (Array Int us_rep))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort uml_control_flow_access 0)

(declare-fun uml_control_flow_accessqtint (uml_control_flow_access) Int)

;; uml_control_flow_access'axiom
  (assert
  (forall ((i uml_control_flow_access))
  (and (<= 0 (uml_control_flow_accessqtint i))
  (<= (uml_control_flow_accessqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq7 (uml_control_flow_access uml_control_flow_access) Bool)

(declare-const dummy7 uml_control_flow_access)

(declare-datatypes ((uml_control_flow_access__ref 0))
(((uml_control_flow_access__refqtmk
  (uml_control_flow_access__content uml_control_flow_access)))))
(define-fun uml_control_flow_access__ref_uml_control_flow_access__content__projection ((a uml_control_flow_access__ref)) uml_control_flow_access 
  (uml_control_flow_access__content a))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_181)))

(define-fun dynamic_invariant1 ((temp___expr_307 Int)
  (temp___is_init_303 Bool) (temp___skip_constant_304 Bool)
  (temp___do_toplevel_305 Bool)
  (temp___do_typ_inv_306 Bool)) Bool (=>
                                     (or (= temp___is_init_303 true)
                                     (<= 0 100)) (in_range2 temp___expr_307)))

(define-fun dynamic_invariant2 ((temp___expr_334 Int)
  (temp___is_init_330 Bool) (temp___skip_constant_331 Bool)
  (temp___do_toplevel_332 Bool)
  (temp___do_typ_inv_333 Bool)) Bool (=>
                                     (or (= temp___is_init_330 true)
                                     (<= 0 100)) (in_range3 temp___expr_334)))

(assert
;; defqtvc
 ;; File "model.ads", line 137, characters 0-0
  (not
  (forall ((self__split_fields us_split_fields4))
  (forall ((self__split_fields1 us_split_fields4))
  (=>
  (= self__split_fields1 (us_split_fieldsqtmk2 val__
                         (rec__model__uml_activity__owned_flow_data
                         self__split_fields)))
  (=>
  (forall ((self__split_fields2 us_split_fields4))
  (owned_action__function_guard
  (owned_action (us_repqtmk2 self__split_fields2))
  (us_repqtmk2 self__split_fields2)))
  (= (bool_eq1 (owned_action (us_repqtmk2 self__split_fields1)) 0 100 
     val__ 0 100) true)))))))
(check-sat)
(exit)
