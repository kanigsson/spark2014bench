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

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep1)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep1) (b us_rep1)) Bool (ite true true false))

(declare-fun us_dispatch_eq (us_rep1 us_rep1) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy1 us_rep1)

(declare-datatypes ((tinterface_jauge__ref 0))
(((tinterface_jauge__refqtmk (tinterface_jauge__content us_rep1)))))
(define-fun tinterface_jauge__ref_tinterface_jauge__content__projection ((a tinterface_jauge__ref)) us_rep1 
  (tinterface_jauge__content a))

(declare-fun oeqR (us_rep1 us_rep1) Bool)

(declare-fun oeqR__function_guard (Bool us_rep1 us_rep1) Bool)

(declare-fun get (us_rep Int) us_rep1)

(declare-fun get__function_guard (us_rep1 us_rep Int) Bool)

(define-fun contains ((container us_rep) (fst Int) (lst Int)
  (item us_rep1)) Bool (ite (exists ((i Int))
                            (and (and (<= fst i) (<= i lst))
                            (= (oeqR (get container i) item) true)))
                       true false))

(declare-fun contains__function_guard (Bool us_rep Int Int us_rep1) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun last ((container us_rep)) Int (+ 0 (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 4))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (capacity_range capacity_range) Bool)

(declare-const dummy2 capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__objt_types_jauge__objt_liste_jauge__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__objt_types_jauge__objt_liste_jauge__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__objt_types_jauge__objt_liste_jauge__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__objt_types_jauge__objt_liste_jauge__vector us_main_type1)))))
(define-fun us_split_fields_rec__objt_types_jauge__objt_liste_jauge__vector__projection ((a us_split_fields2)) us_main_type1 
  (rec__objt_types_jauge__objt_liste_jauge__vector a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun in_range2 ((rec__objt_types_jauge__objt_liste_jauge__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__objt_types_jauge__objt_liste_jauge__vector__capacity1 
  (to_rep (rec__objt_types_jauge__objt_liste_jauge__vector__capacity a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const objt_types_jauge__objt_liste_jauge__vector__capacity__first__bit Int)

(declare-const objt_types_jauge__objt_liste_jauge__vector__capacity__last__bit Int)

(declare-const objt_types_jauge__objt_liste_jauge__vector__capacity__position Int)

;; objt_types_jauge__objt_liste_jauge__vector__capacity__first__bit_axiom
  (assert
  (<= 0 objt_types_jauge__objt_liste_jauge__vector__capacity__first__bit))

;; objt_types_jauge__objt_liste_jauge__vector__capacity__last__bit_axiom
  (assert
  (< objt_types_jauge__objt_liste_jauge__vector__capacity__first__bit 
  objt_types_jauge__objt_liste_jauge__vector__capacity__last__bit))

;; objt_types_jauge__objt_liste_jauge__vector__capacity__position_axiom
  (assert
  (<= 0 objt_types_jauge__objt_liste_jauge__vector__capacity__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep2)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep2 
  (vector__content a))

(declare-fun model1 (us_rep2) us_rep)

(declare-fun model__function_guard (us_rep us_rep2) Bool)

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq ((left us_rep)
  (right us_rep)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((n Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 1 n)
                                                                  (<= n 
                                                                  (last left)))
                                                                  (= 
                                                                  (oeqR
                                                                  (get left
                                                                  n)
                                                                  (get right
                                                                  n)) true)))
                                                             true false)))

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_280 us_rep)
  (temp___skip_top_level_281 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_281 true))
                                         (= (length temp___expr_280) 0)))

(define-fun last_index ((container us_rep2)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep2) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 5))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (extended_index extended_index) Bool)

(declare-const dummy4 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant ((temp___expr_231 Int)
  (temp___is_init_227 Bool) (temp___skip_constant_228 Bool)
  (temp___do_toplevel_229 Bool)
  (temp___do_typ_inv_230 Bool)) Bool (=>
                                     (or (= temp___is_init_227 true)
                                     (<= 0 5)) (in_range3 temp___expr_231)))

;; last_index__post_axiom
  (assert
  (forall ((container us_rep2)) (! (in_range3
  (last_index container)) :pattern ((last_index container)) )))

(declare-fun oeq1 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq3 a b) (oeq1 a b)) :pattern ((user_eq3 a b)) )))

(declare-const container us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const item us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const index Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (index_type index_type) Bool)

(declare-const dummy5 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_207 Int)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (or (= temp___is_init_203 true)
                                     (<= 1 4)) (in_range4 temp___expr_207)))

(define-fun default_initial_assumption1 ((temp___expr_215 us_rep1)
  (temp___skip_top_level_216 Bool)) Bool (= (attr__tag temp___expr_215) 
  us_tag))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 4))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (extended_index1 extended_index1) Bool)

(declare-const dummy6 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (count_type count_type) Bool)

(declare-const dummy7 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_238 Int)
  (temp___is_init_234 Bool) (temp___skip_constant_235 Bool)
  (temp___do_toplevel_236 Bool)
  (temp___do_typ_inv_237 Bool)) Bool (=>
                                     (or (= temp___is_init_234 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_238)))

(define-fun dynamic_invariant3 ((temp___expr_245 Int)
  (temp___is_init_241 Bool) (temp___skip_constant_242 Bool)
  (temp___do_toplevel_243 Bool)
  (temp___do_typ_inv_244 Bool)) Bool (=>
                                     (or (= temp___is_init_241 true)
                                     (<= 0 4)) (in_range1 temp___expr_245)))

(define-fun capacity ((container1 us_rep2)) Int (ite (= (distinct 1 0) true)
                                                (to_rep
                                                (rec__objt_types_jauge__objt_liste_jauge__vector__capacity
                                                (us_split_discrs1 container1)))
                                                4))

(declare-fun capacity__function_guard (Int us_rep2) Bool)

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2)) (! (in_range1
  (length1 container1)) :pattern ((length1 container1)) )))

;; capacity__post_axiom
  (assert
  (forall ((container1 us_rep2)) (! (in_range1
  (capacity container1)) :pattern ((capacity container1)) )))

(define-fun dynamic_invariant4 ((temp___expr_272 Int)
  (temp___is_init_268 Bool) (temp___skip_constant_269 Bool)
  (temp___do_toplevel_270 Bool)
  (temp___do_typ_inv_271 Bool)) Bool (=>
                                     (or (= temp___is_init_268 true)
                                     (<= 0 4)) (in_range5 temp___expr_272)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep)) (! (in_range6
  (length container1)) :pattern ((length container1)) )))

;; last__post_axiom
  (assert
  (forall ((container1 us_rep)) (! (in_range5
  (last container1)) :pattern ((last container1)) )))

(assert
;; defqtvc
 ;; File "a-cfinve.ads", line 755, characters 0-0
  (not
  (=> (dynamic_invariant1 index true false true true)
  (let ((o container))
  (let ((o1 (last_index o)))
  (=>
  (and (dynamic_invariant o1 true false true true) (= o1 (last (model1 o))))
  (=> (not (<= index o1))
  (let ((o2 container))
  (let ((o3 (last_index o2)))
  (=>
  (and (dynamic_invariant o3 true false true true) (= o3 (last (model1 o2))))
  (in_range5 o3)))))))))))
(check-sat)
(exit)
