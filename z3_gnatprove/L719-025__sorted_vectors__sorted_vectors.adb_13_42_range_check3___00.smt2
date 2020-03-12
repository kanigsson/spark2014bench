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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (capacity_range capacity_range) Bool)

(declare-const dummy1 capacity_range)

(declare-datatypes ()
((capacity_range__ref
 (capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__sorted_vectors__my_vectors__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__sorted_vectors__my_vectors__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__sorted_vectors__my_vectors__vector__capacity a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__sorted_vectors__my_vectors__vector us_main_type)))))
(define-fun us_split_fields_rec__sorted_vectors__my_vectors__vector__projection ((a us_split_fields)) us_main_type 
  (rec__sorted_vectors__my_vectors__vector a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__sorted_vectors__my_vectors__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__sorted_vectors__my_vectors__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__sorted_vectors__my_vectors__vector
                           (us_split_fields1 a))
                           (rec__sorted_vectors__my_vectors__vector
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__sorted_vectors__my_vectors__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__sorted_vectors__my_vectors__vector__capacity1 
  (to_rep (rec__sorted_vectors__my_vectors__vector__capacity a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const sorted_vectors__my_vectors__vector__capacity__first__bit Int)

(declare-const sorted_vectors__my_vectors__vector__capacity__last__bit Int)

(declare-const sorted_vectors__my_vectors__vector__capacity__position Int)

;; sorted_vectors__my_vectors__vector__capacity__first__bit_axiom
  (assert (<= 0 sorted_vectors__my_vectors__vector__capacity__first__bit))

;; sorted_vectors__my_vectors__vector__capacity__last__bit_axiom
  (assert
  (< sorted_vectors__my_vectors__vector__capacity__first__bit sorted_vectors__my_vectors__vector__capacity__last__bit))

;; sorted_vectors__my_vectors__vector__capacity__position_axiom
  (assert (<= 0 sorted_vectors__my_vectors__vector__capacity__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((vector__ref (vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__sorted_vectors__my_vectors__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq2 a b) (oeq a b)) :pattern ((user_eq2 a b)) )))

(define-fun dynamic_invariant ((temp___expr_250 Int)
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool)
  (temp___do_typ_inv_249 Bool)) Bool (=>
                                     (or (= temp___is_init_246 true)
                                     (<= 0 100)) (in_range2 temp___expr_250)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant result true
     false true true))) :pattern ((length container)) )))

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

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 1 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-const dummy4 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_274 Int)
  (temp___is_init_270 Bool) (temp___skip_constant_271 Bool)
  (temp___do_toplevel_272 Bool)
  (temp___do_typ_inv_273 Bool)) Bool (=>
                                     (or (= temp___is_init_270 true)
                                     (<= 1 100)) (in_range4 temp___expr_274)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_281 Int)
  (temp___is_init_277 Bool) (temp___skip_constant_278 Bool)
  (temp___do_toplevel_279 Bool)
  (temp___do_typ_inv_280 Bool)) Bool (=>
                                     (or (= temp___is_init_277 true)
                                     (<= 0 100)) (in_range5 temp___expr_281)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq1 ((left us_rep1)
  (right us_rep1)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq3 a b) (oeq1 a b)) :pattern ((user_eq3 a b)) )))

(define-fun default_initial_assumption ((temp___expr_289 us_rep1)
  (temp___skip_top_level_290 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_290 true))
                                         (= (length1 temp___expr_289) 0)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant2 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant1 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-fun first_index__function_guard (Int us_rep) Bool)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (index_type index_type) Bool)

(declare-const dummy6 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__2__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_222 Int)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (or (= temp___is_init_218 true)
                                     (<= 1 100)) (in_range6 temp___expr_222)))

(define-fun element ((container us_rep)
  (index Int)) Int (get (model1 container) index))

(declare-fun element__function_guard (Int us_rep Int) Bool)

(define-fun last_index ((container us_rep)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep) Bool)

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 1 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (element_type1 element_type1) Bool)

(declare-const dummy7 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant4 ((temp___expr_229 Int)
  (temp___is_init_225 Bool) (temp___skip_constant_226 Bool)
  (temp___do_toplevel_227 Bool)
  (temp___do_typ_inv_228 Bool)) Bool (=>
                                     (or (= temp___is_init_225 true)
                                     (<= 1 100)) (in_range7 temp___expr_229)))

(define-fun range_equal ((left us_rep1) (right us_rep1) (fst Int)
  (lst Int)) Bool (ite (forall ((i Int))
                       (=> (and (<= fst i) (<= i lst))
                       (= (get left i) (get right i))))
                  true false))

(declare-fun range_equal__function_guard (Bool us_rep1 us_rep1 Int Int) Bool)

(define-fun range_shifted ((left us_rep1) (right us_rep1) (fst Int) (lst Int)
  (offset Int)) Bool (and (ite (forall ((i Int))
                               (=> (and (<= fst i) (<= i lst))
                               (= (get left i) (get right (+ i offset)))))
                          true false) (ite (forall ((i Int))
                                           (=>
                                           (and (<= (+ fst offset) i)
                                           (<= i (+ lst offset)))
                                           (= (get left (- i offset)) 
                                           (get right i))))
                                      true false)))

(declare-fun range_shifted__function_guard (Bool us_rep1 us_rep1 Int Int
  Int) Bool)

(declare-fun my_lt (Int Int) Bool)

(declare-fun my_lt__function_guard (Bool Int Int) Bool)

;; temp___result_202'def
  (assert
  (forall ((container us_rep1) (i Int) (j Int)) (my_lt__function_guard
  (my_lt (get container i) (get container j)) (get container i)
  (get container j))))

(define-fun m_elements_sorted ((container us_rep1)) Bool (ite (forall
                                                              ((i Int))
                                                              (=>
                                                              (and (<= 1 i)
                                                              (<= i (last
                                                                    container)))
                                                              (forall
                                                              ((j Int))
                                                              (=>
                                                              (and (<= i j)
                                                              (<= j (last
                                                                    container)))
                                                              (or
                                                              (= (get
                                                                 container i) 
                                                              (get container
                                                              j))
                                                              (= (my_lt
                                                                 (get
                                                                 container i)
                                                                 (get
                                                                 container j)) true))))))
                                                         true false))

(declare-fun m_elements_sorted__function_guard (Bool us_rep1) Bool)

(declare-fun is_sorted (us_rep) Bool)

(declare-fun is_sorted__function_guard (Bool us_rep) Bool)

;; is_sorted__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (= (is_sorted container) true)
     (= (m_elements_sorted (model1 container)) true)) :pattern ((is_sorted
                                                                container)) )))

(declare-const container__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const new_item Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 100))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (element_type2 element_type2) Bool)

(declare-const dummy8 element_type2)

(declare-datatypes ()
((element_type__ref2
 (element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant5 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= 1 100)) (in_range8 temp___expr_208)))

(declare-sort index_type1 0)

(declare-fun index_typeqtint1 (index_type1) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type1))
  (and (<= 1 (index_typeqtint1 i)) (<= (index_typeqtint1 i) 100))))

(define-fun in_range9 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq9 (index_type1 index_type1) Bool)

(declare-const dummy9 index_type1)

(declare-datatypes ()
((index_type__ref1 (index_type__refqtmk1 (index_type__content1 index_type1)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref1)) index_type1 
  (index_type__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range9 temp___expr_215)))

(define-fun dynamic_invariant7 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; my_lt__post_axiom
  (assert true)

;; my_lt__def_axiom
  (assert
  (forall ((i1 Int) (i2 Int))
  (! (= (= (my_lt i1 i2) true) (< i1 i2)) :pattern ((my_lt i1 i2)) )))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range10 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq10 (count_type count_type) Bool)

(declare-const dummy10 count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant8 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= 0 2147483647)) (in_range10
                                     temp___expr_243)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 101))))

(define-fun in_range11 ((x Int)) Bool (and (<= 0 x) (<= x 101)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq11 (extended_index1 extended_index1) Bool)

(declare-const dummy11 extended_index1)

(declare-datatypes ()
((extended_index__ref1
 (extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant9 ((temp___expr_236 Int)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (or (= temp___is_init_232 true)
                                     (<= 0 101)) (in_range11
                                     temp___expr_236)))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 100) (dynamic_invariant8 result true false true
     true))) :pattern ((length1 container)) )))

(declare-const container__split_fields us_main_type)

(declare-const position Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant5 new_item true false true true))

;; Assume
  (assert (dynamic_invariant6 position false false true true))

;; Assume
  (assert
  (< (length
     (us_repqtmk container__split_discrs
     (us_split_fieldsqtmk container__split_fields))) (to_rep
                                                     (rec__sorted_vectors__my_vectors__vector__capacity
                                                     container__split_discrs))))

(define-fun usf () us_rep1 (model1
                           (us_repqtmk container__split_discrs
                           (us_split_fieldsqtmk container__split_fields))))

(define-fun usf1 () us_rep1 (model1
                            (us_repqtmk container__split_discrs
                            (us_split_fieldsqtmk container__split_fields))))

(define-fun usf2 () us_rep1 (model1
                            (us_repqtmk container__split_discrs
                            (us_split_fieldsqtmk container__split_fields))))

(define-fun o () Int 1)

;; H
  (assert (dynamic_invariant3 o true false true true))

;; H
  (assert (= o 1))

(declare-const position1 Int)

;; H
  (assert (= position1 o))

(define-fun o1 () us_rep (us_repqtmk container__split_discrs
                         (us_split_fieldsqtmk container__split_fields)))

(define-fun o2 () Int (length o1))

;; H
  (assert (dynamic_invariant o2 true false true true))

;; H
  (assert (<= o2 (capacity o1)))

;; H
  (assert
  (or (not (<= position1 o2))
  (let ((o3 (us_repqtmk container__split_discrs
            (us_split_fieldsqtmk container__split_fields))))
  (let ((o4 (element o3 position1)))
  (and (dynamic_invariant4 o4 true false true true)
  (= o4 (get (model1 o3) position1)))))))

;; H
  (assert (<= position1 o2))

;; H
  (assert
  (< (element
     (us_repqtmk container__split_discrs
     (us_split_fieldsqtmk container__split_fields)) position1) new_item))

(define-fun o3 () Int 1)

;; H
  (assert (dynamic_invariant3 o3 true false true true))

;; H
  (assert (= o3 1))

;; H
  (assert (not (= position1 o3)))

(define-fun o4 () Int (- position1 1))

(assert
;; defqtvc
 ;; File "sorted_vectors.ads", line 20, characters 0-0
  (not (in_range6 o4)))
(check-sat)
