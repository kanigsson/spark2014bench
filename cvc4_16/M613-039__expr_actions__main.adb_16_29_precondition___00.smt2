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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
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
  (forall ((x capacity_range)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__list__my_lists__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__list__my_lists__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__list__my_lists__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__list__my_lists__vector us_main_type)))))
(define-fun us_split_fields_rec__list__my_lists__vector__projection ((a us_split_fields)) us_main_type 
  (rec__list__my_lists__vector a))

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
                        (= (to_rep
                           (rec__list__my_lists__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__list__my_lists__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__list__my_lists__vector (us_split_fields1 a))
                           (rec__list__my_lists__vector (us_split_fields1 b))) true))
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

(declare-const list__my_lists__vector__capacity__first__bit Int)

(declare-const list__my_lists__vector__capacity__last__bit Int)

(declare-const list__my_lists__vector__capacity__position Int)

;; list__my_lists__vector__capacity__first__bit_axiom
  (assert (<= 0 list__my_lists__vector__capacity__first__bit))

;; list__my_lists__vector__capacity__last__bit_axiom
  (assert
  (< list__my_lists__vector__capacity__first__bit list__my_lists__vector__capacity__last__bit))

;; list__my_lists__vector__capacity__position_axiom
  (assert (<= 0 list__my_lists__vector__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(define-fun in_range1 ((rec__list__my_lists__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__list__my_lists__vector__capacity1 
  (to_rep (rec__list__my_lists__vector__capacity a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const list__my_lists__vector__capacity__first__bit1 Int)

(declare-const list__my_lists__vector__capacity__last__bit1 Int)

(declare-const list__my_lists__vector__capacity__position1 Int)

;; list__my_lists__vector__capacity__first__bit_axiom
  (assert (<= 0 list__my_lists__vector__capacity__first__bit1))

;; list__my_lists__vector__capacity__last__bit_axiom
  (assert
  (< list__my_lists__vector__capacity__first__bit1 list__my_lists__vector__capacity__last__bit1))

;; list__my_lists__vector__capacity__position_axiom
  (assert (<= 0 list__my_lists__vector__capacity__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(declare-const l__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_216 us_rep)
  (temp___is_init_212 Bool) (temp___skip_constant_213 Bool)
  (temp___do_toplevel_214 Bool)
  (temp___do_typ_inv_215 Bool)) Bool (=>
                                     (not (= temp___skip_constant_213 true))
                                     (in_range1 100
                                     (us_split_discrs1 temp___expr_216))))

(define-fun default_initial_assumption ((temp___expr_218 us_rep)
  (temp___skip_top_level_219 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__list__my_lists__vector__capacity
                                            (us_split_discrs1
                                            temp___expr_218))) 100)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_219 true))
                                         (= (is_empty temp___expr_218) true))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__list__my_lists__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-fun length2 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length2 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(define-fun olt ((left us_rep1)
  (right us_rep1)) Bool (and (< (length2 left) (length2 right)) (ite 
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

(declare-fun olt__function_guard (Bool us_rep1 us_rep1) Bool)

(define-fun last_index ((container us_rep)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep) Bool)

(declare-fun first_index__function_guard (Int us_rep) Bool)

(define-fun element ((container us_rep)
  (index Int)) Int (get (model1 container) index))

(declare-fun element__function_guard (Int us_rep Int) Bool)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-const dummy4 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_226 Int)
  (temp___is_init_222 Bool) (temp___skip_constant_223 Bool)
  (temp___do_toplevel_224 Bool)
  (temp___do_typ_inv_225 Bool)) Bool (=>
                                     (or (= temp___is_init_222 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_226)))

(declare-fun reverse_list (us_rep) us_rep)

(declare-fun reverse_list__function_guard (us_rep us_rep) Bool)

;; reverse_list__post_axiom
  (assert
  (forall ((l us_rep))
  (! (=> (dynamic_invariant l true true true true)
     (let ((result (reverse_list l)))
     (=> (reverse_list__function_guard result l)
     (and
     (forall ((i Int))
     (=> (and (<= 1 i) (<= i (last_index l)))
     (= (element l i) (element result (+ (- (last_index l) i) 1)))))
     (dynamic_invariant result true false true true))))) :pattern ((reverse_list
                                                                   l)) )))

(declare-const rev_l__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (count_type count_type) Bool)

(declare-const dummy5 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_196)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 101))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 101)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy6 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant3 ((temp___expr_282 Int)
  (temp___is_init_278 Bool) (temp___skip_constant_279 Bool)
  (temp___do_toplevel_280 Bool)
  (temp___do_typ_inv_281 Bool)) Bool (=>
                                     (or (= temp___is_init_278 true)
                                     (<= 0 101)) (in_range5 temp___expr_282)))

(define-fun dynamic_invariant4 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= 0 100)) (in_range temp___expr_203)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant4 result true
     false true true))) :pattern ((length container)) )))

(define-fun default_initial_assumption1 ((temp___expr_238 us_rep1)
  (temp___skip_top_level_239 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_239 true))
                                         (= (length2 temp___expr_238) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length2 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (= (is_empty container) true) (= (length container) 0)) :pattern (
  (is_empty container)) )))

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

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_252 Int)
  (temp___is_init_248 Bool) (temp___skip_constant_249 Bool)
  (temp___do_toplevel_250 Bool)
  (temp___do_typ_inv_251 Bool)) Bool (=>
                                     (or (= temp___is_init_248 true)
                                     (<= 1 100)) (in_range6 temp___expr_252)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i)) (<= (extended_indexqtint1 i) 100))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (extended_index1 extended_index1) Bool)

(declare-const dummy8 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_266 Int)
  (temp___is_init_262 Bool) (temp___skip_constant_263 Bool)
  (temp___do_toplevel_264 Bool)
  (temp___do_typ_inv_265 Bool)) Bool (=>
                                     (or (= temp___is_init_262 true)
                                     (<= 0 100)) (in_range7 temp___expr_266)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length2 container)))
     (and (<= (+ 0 result) 100) (dynamic_invariant2 result true false true
     true))) :pattern ((length2 container)) )))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= (- 2147483648) (element_typeqtint1 i))
  (<= (element_typeqtint1 i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (element_type1 element_type1) Bool)

(declare-const dummy9 element_type1)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant7 ((temp___expr_273 Int)
  (temp___is_init_269 Bool) (temp___skip_constant_270 Bool)
  (temp___do_toplevel_271 Bool)
  (temp___do_typ_inv_272 Bool)) Bool (=>
                                     (or (= temp___is_init_269 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range8 temp___expr_273)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant6 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant7 (get container position) true false true true)) :pattern (
  (get container position)) ))))

(assert
;; defqtvc
 ;; File "main.adb", line 3, characters 0-0
  (not
  (forall ((l__split_fields us_main_type) (i Int))
  (=> (default_initial_assumption
  (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields)) false)
  (=> (dynamic_invariant
  (us_repqtmk l__split_discrs (us_split_fieldsqtmk l__split_fields)) false
  false true true)
  (=> (= i 1)
  (let ((o l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields))) (+ 
  (length (us_repqtmk o (us_split_fieldsqtmk l__split_fields))) 1))
  (= (olt (model1 (us_repqtmk o (us_split_fieldsqtmk l__split_fields)))
     (model1
     (us_repqtmk o
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields)))) true))
  (= (get
     (model1
     (us_repqtmk o
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields)))
     (+ (last_index (us_repqtmk o (us_split_fieldsqtmk l__split_fields))) 1)) i))
  (forall ((l__split_fields1 us_main_type))
  (=> (= l__split_fields1 list__my_lists__append__2__container__fields)
  (forall ((i1 Int))
  (=> (= i1 2)
  (let ((o1 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields1 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o1
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields1))) (+ 
  (length (us_repqtmk o1 (us_split_fieldsqtmk l__split_fields1))) 1))
  (= (olt (model1 (us_repqtmk o1 (us_split_fieldsqtmk l__split_fields1)))
     (model1
     (us_repqtmk o1
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields1)))) true))
  (= (get
     (model1
     (us_repqtmk o1
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields1)))
     (+ (last_index (us_repqtmk o1 (us_split_fieldsqtmk l__split_fields1))) 1)) i1))
  (forall ((l__split_fields2 us_main_type))
  (=> (= l__split_fields2 list__my_lists__append__2__container__fields1)
  (forall ((i2 Int))
  (=> (= i2 3)
  (let ((o2 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields2 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o2
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields2))) (+ 
  (length (us_repqtmk o2 (us_split_fieldsqtmk l__split_fields2))) 1))
  (= (olt (model1 (us_repqtmk o2 (us_split_fieldsqtmk l__split_fields2)))
     (model1
     (us_repqtmk o2
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields2)))) true))
  (= (get
     (model1
     (us_repqtmk o2
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields2)))
     (+ (last_index (us_repqtmk o2 (us_split_fieldsqtmk l__split_fields2))) 1)) i2))
  (forall ((l__split_fields3 us_main_type))
  (=> (= l__split_fields3 list__my_lists__append__2__container__fields2)
  (forall ((i3 Int))
  (=> (= i3 4)
  (let ((o3 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields3 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o3
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields3))) (+ 
  (length (us_repqtmk o3 (us_split_fieldsqtmk l__split_fields3))) 1))
  (= (olt (model1 (us_repqtmk o3 (us_split_fieldsqtmk l__split_fields3)))
     (model1
     (us_repqtmk o3
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields3)))) true))
  (= (get
     (model1
     (us_repqtmk o3
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields3)))
     (+ (last_index (us_repqtmk o3 (us_split_fieldsqtmk l__split_fields3))) 1)) i3))
  (forall ((l__split_fields4 us_main_type))
  (=> (= l__split_fields4 list__my_lists__append__2__container__fields3)
  (forall ((i4 Int))
  (=> (= i4 5)
  (let ((o4 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields4 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o4
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields4))) (+ 
  (length (us_repqtmk o4 (us_split_fieldsqtmk l__split_fields4))) 1))
  (= (olt (model1 (us_repqtmk o4 (us_split_fieldsqtmk l__split_fields4)))
     (model1
     (us_repqtmk o4
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields4)))) true))
  (= (get
     (model1
     (us_repqtmk o4
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields4)))
     (+ (last_index (us_repqtmk o4 (us_split_fieldsqtmk l__split_fields4))) 1)) i4))
  (forall ((l__split_fields5 us_main_type))
  (=> (= l__split_fields5 list__my_lists__append__2__container__fields4)
  (forall ((i5 Int))
  (=> (= i5 6)
  (let ((o5 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields5 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o5
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields5))) (+ 
  (length (us_repqtmk o5 (us_split_fieldsqtmk l__split_fields5))) 1))
  (= (olt (model1 (us_repqtmk o5 (us_split_fieldsqtmk l__split_fields5)))
     (model1
     (us_repqtmk o5
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields5)))) true))
  (= (get
     (model1
     (us_repqtmk o5
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields5)))
     (+ (last_index (us_repqtmk o5 (us_split_fieldsqtmk l__split_fields5))) 1)) i5))
  (forall ((l__split_fields6 us_main_type))
  (=> (= l__split_fields6 list__my_lists__append__2__container__fields5)
  (forall ((i6 Int))
  (=> (= i6 7)
  (let ((o6 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields6 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o6
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields6))) (+ 
  (length (us_repqtmk o6 (us_split_fieldsqtmk l__split_fields6))) 1))
  (= (olt (model1 (us_repqtmk o6 (us_split_fieldsqtmk l__split_fields6)))
     (model1
     (us_repqtmk o6
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields6)))) true))
  (= (get
     (model1
     (us_repqtmk o6
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields6)))
     (+ (last_index (us_repqtmk o6 (us_split_fieldsqtmk l__split_fields6))) 1)) i6))
  (forall ((l__split_fields7 us_main_type))
  (=> (= l__split_fields7 list__my_lists__append__2__container__fields6)
  (forall ((i7 Int))
  (=> (= i7 8)
  (let ((o7 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields7 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o7
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields7))) (+ 
  (length (us_repqtmk o7 (us_split_fieldsqtmk l__split_fields7))) 1))
  (= (olt (model1 (us_repqtmk o7 (us_split_fieldsqtmk l__split_fields7)))
     (model1
     (us_repqtmk o7
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields7)))) true))
  (= (get
     (model1
     (us_repqtmk o7
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields7)))
     (+ (last_index (us_repqtmk o7 (us_split_fieldsqtmk l__split_fields7))) 1)) i7))
  (forall ((l__split_fields8 us_main_type))
  (=> (= l__split_fields8 list__my_lists__append__2__container__fields7)
  (forall ((i8 Int))
  (=> (= i8 9)
  (let ((o8 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields8 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o8
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields8))) (+ 
  (length (us_repqtmk o8 (us_split_fieldsqtmk l__split_fields8))) 1))
  (= (olt (model1 (us_repqtmk o8 (us_split_fieldsqtmk l__split_fields8)))
     (model1
     (us_repqtmk o8
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields8)))) true))
  (= (get
     (model1
     (us_repqtmk o8
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields8)))
     (+ (last_index (us_repqtmk o8 (us_split_fieldsqtmk l__split_fields8))) 1)) i8))
  (forall ((l__split_fields9 us_main_type))
  (=> (= l__split_fields9 list__my_lists__append__2__container__fields8)
  (forall ((i9 Int))
  (=> (= i9 10)
  (let ((o9 l__split_discrs))
  (forall ((list__my_lists__append__2__container__fields9 us_main_type))
  (=>
  (and
  (and
  (= (length
     (us_repqtmk o9
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields9))) (+ 
  (length (us_repqtmk o9 (us_split_fieldsqtmk l__split_fields9))) 1))
  (= (olt (model1 (us_repqtmk o9 (us_split_fieldsqtmk l__split_fields9)))
     (model1
     (us_repqtmk o9
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields9)))) true))
  (= (get
     (model1
     (us_repqtmk o9
     (us_split_fieldsqtmk list__my_lists__append__2__container__fields9)))
     (+ (last_index (us_repqtmk o9 (us_split_fieldsqtmk l__split_fields9))) 1)) i9))
  (forall ((l__split_fields10 us_main_type))
  (=> (= l__split_fields10 list__my_lists__append__2__container__fields9)
  (let ((o10 (us_repqtmk l__split_discrs
             (us_split_fieldsqtmk l__split_fields10))))
  (let ((main__B_2__rev_l__assume (reverse_list o10)))
  (=>
  (and (reverse_list__function_guard main__B_2__rev_l__assume o10)
  (and (dynamic_invariant main__B_2__rev_l__assume true false true true)
  (forall ((i10 Int))
  (=> (and (<= 1 i10) (<= i10 (last_index o10)))
  (= (element o10 i10) (element main__B_2__rev_l__assume
                       (+ (- (last_index o10) i10) 1)))))))
  (forall ((rev_l__split_fields us_main_type))
  (=>
  (= (us_split_fieldsqtmk rev_l__split_fields) (us_split_fields1
                                               main__B_2__rev_l__assume))
  (=> (= rev_l__split_discrs (us_split_discrs1 main__B_2__rev_l__assume))
  (=> (dynamic_invariant
  (us_repqtmk rev_l__split_discrs (us_split_fieldsqtmk rev_l__split_fields))
  true false true true) (forall ((i10 Int)) (=> (= i10 1) (<= 1 i10))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
